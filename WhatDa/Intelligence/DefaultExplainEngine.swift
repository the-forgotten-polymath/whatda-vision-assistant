//
//  DefaultExplainEngine.swift
//  WhatDa
//

import Foundation

public final class DefaultExplainEngine: ExplainEngine, @unchecked Sendable {
    public init() {}

    public func explain(image: CapturedImage, context: VisualContext) async throws -> ExplanationResult {
        // Simulate a brief generation delay for organic response feel
        try await Task.sleep(nanoseconds: 250_000_000)

        let recognizedSnippets = context.recognizedText.map { $0.text }
        let barcodePayload = context.barcodes.first?.payload
        let topObservation = context.observations.first
        let topLabel = topObservation?.label.lowercased() ?? ""
        let combinedLabels = context.observations.map { $0.label.lowercased() }.joined(separator: " ")
        let combinedText = recognizedSnippets.joined(separator: " ")

        // 1. Barcode groundings (explicit barcodes take precedence)
        if let barcode = barcodePayload {
            return ExplanationResult(
                subject: "Product Barcode (\(barcode))",
                confidence: .high,
                definition: "A machine-readable optical code encoding numerical or alphanumeric product identification data.",
                simpleExplanation: "This unique pattern of lines or QR blocks lets scanners instantly look up product details, inventory, and pricing.",
                analogy: "Think of it like a digital passport stamp for manufactured goods.",
                funFact: "The world's first commercial barcode scan took place in Ohio in June 1974 on a 10-pack of Wrigley's Juicy Fruit gum!",
                observations: context.observations,
                followUpQuestions: [
                    "Which company registered this barcode?",
                    "What is the difference between UPC and QR codes?",
                    "How do optical barcode readers scan data?"
                ],
                category: .object
            )
        }

        // 3. Dynamic Any-Object Explanation Generator
        let (rawSubject, category) = inferSubjectAndCategory(from: context.observations)
        let formattedSubject = formatSubjectTitle(rawSubject)

        let (definition, simpleExplanation, analogy, funFact, questions) = generateDynamicDetails(
            for: formattedSubject,
            category: category,
            combinedLabels: combinedLabels
        )

        return ExplanationResult(
            subject: formattedSubject,
            confidence: topObservation?.confidence ?? 0 > 0.3 ? .high : .medium,
            definition: definition,
            simpleExplanation: simpleExplanation,
            analogy: analogy,
            funFact: funFact,
            observations: context.observations,
            followUpQuestions: questions,
            category: category
        )
    }

    // MARK: - Helpers
    private func inferSubjectAndCategory(from observations: [VisualObservation]) -> (String, SubjectCategory) {
        guard let top = observations.first else {
            return ("Everyday Item", .object)
        }

        let label = top.label.lowercased()

        // Refine generic "machine" or "electronic device" if more specific labels exist
        if label == "machine" || label == "electronic equipment" || label == "object" {
            for obs in observations.dropFirst() {
                let sub = obs.label.lowercased()
                if sub.contains("mouse") || sub.contains("keyboard") || sub.contains("laptop") || sub.contains("computer") || sub.contains("earphone") || sub.contains("headphone") || sub.contains("audio") {
                    return (obs.label, .technology)
                }
            }
        }

        if label.contains("audio") || label.contains("headphone") || label.contains("earphone") || label.contains("airpod") || label.contains("earbud") || label.contains("speaker") || label.contains("computer") || label.contains("laptop") || label.contains("keyboard") || label.contains("phone") || label.contains("screen") || label.contains("camera") || label.contains("electronic") || label.contains("gadget") || label.contains("clock") || label.contains("watch") || label.contains("machine") {
            return (top.label, .technology)
        } else if label.contains("dog") || label.contains("cat") || label.contains("bird") || label.contains("animal") || label.contains("pet") || label.contains("fish") || label.contains("horse") {
            return (top.label, .animal)
        } else if label.contains("flower") || label.contains("plant") || label.contains("tree") || label.contains("leaf") || label.contains("succulent") || label.contains("rose") {
            return (top.label, .plant)
        } else if label.contains("apple") || label.contains("food") || label.contains("fruit") || label.contains("bread") || label.contains("coffee") || label.contains("bottle") || label.contains("cup") || label.contains("mug") || label.contains("dish") {
            return (top.label, .food)
        } else if label.contains("car") || label.contains("vehicle") || label.contains("bicycle") || label.contains("bike") || label.contains("motorcycle") || label.contains("bus") {
            return (top.label, .vehicle)
        } else if label.contains("building") || label.contains("house") || label.contains("bridge") || label.contains("tower") || label.contains("architecture") {
            return (top.label, .architecture)
        } else if label.contains("painting") || label.contains("art") || label.contains("sculpture") || label.contains("drawing") {
            return (top.label, .artwork)
        } else {
            return (top.label, .object)
        }
    }

    private func formatSubjectTitle(_ raw: String) -> String {
        var words = raw.replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: "-", with: " ")
            .capitalized

        if words == "Machine" || words == "Electronic Equipment" {
            words = "Computer Hardware & Accessory"
        }
        return words
    }

    private func generateDynamicDetails(
        for subject: String,
        category: SubjectCategory,
        combinedLabels: String
    ) -> (String, String, String, String, [String]) {
        let lower = subject.lowercased()

        // Mouse & Wireless Accessories
        if lower.contains("mouse") || lower.contains("accessory") || lower.contains("earbud") || lower.contains("earphone") || lower.contains("airpod") || lower.contains("headphone") || lower.contains("audio") {
            return (
                "A wireless computer accessory sitting on a laptop palm rest, engineered with optical tracking sensors, Bluetooth microchips, and rechargeable lithium power.",
                "This picture shows a wireless computer accessory resting next to a laptop trackpad and keyboard. It communicates wirelessly via Bluetooth to move the pointer or process commands.",
                "Think of it like a tiny wireless remote control for your computer screen.",
                "Optical mice and modern wireless accessories take thousands of microscopic digital snapshots per second to track motion down to the millimeter!",
                [
                    "How does optical movement tracking work?",
                    "How do wireless devices pair seamlessly via Bluetooth?",
                    "What is the difference between a trackpad and a wireless mouse?"
                ]
            )
        }

        // Computers & Keyboards & Laptop
        if lower.contains("keyboard") || lower.contains("computer") || lower.contains("laptop") || lower.contains("phone") || lower.contains("macbook") || lower.contains("machine") {
            return (
                "An electronic computing input device and housing engineered to convert physical keypresses or touch inputs into digital commands for processor execution.",
                "This device lets you interact with software by sending electrical signals whenever keys, trackpads, or controls are used.",
                "Think of it like a digital control center for running applications.",
                "Laptop keyboards use membrane or butterfly switches under keycaps that complete an electric circuit when pressed!",
                [
                    "Why are keyboard keys arranged in QWERTY layout?",
                    "How does a trackpad detect multi-touch finger gestures?",
                    "What materials are laptop chassis built from?"
                ]
            )
        }

        // Cups & Bottles & Drinks
        if lower.contains("mug") || lower.contains("cup") || lower.contains("bottle") || lower.contains("glass") || lower.contains("container") {
            return (
                "A fluid storage vessel crafted from ceramic, glass, plastic, or metal designed for liquid containment and thermal control.",
                "This container holds liquids like water, coffee, or tea, keeping them clean and easy to drink from.",
                "Think of it like a portable reservoir for your everyday beverages.",
                "Ceramic mugs hold heat well because fired clay has a low thermal conductivity rating!",
                [
                    "What material retains heat best for hot drinks?",
                    "How are ceramic mugs glazed and fired?",
                    "What makes double-walled insulation work?"
                ]
            )
        }

        // Plants & Nature
        if category == .plant {
            return (
                "A botanical organism capable of converting sunlight, carbon dioxide, and water into chemical energy via photosynthesis.",
                "This is a living plant that produces oxygen and absorbs light to grow.",
                "Think of a plant leaf like a tiny solar panel powered by water and air.",
                "Plants green color comes from chlorophyll, the pigment responsible for absorbing sunlight energy!",
                [
                    "How often does this plant need sunlight?",
                    "How does photosynthesis convert light into plant food?",
                    "What soil nutrients help this plant thrive?"
                ]
            )
        }

        // Animals & Pets
        if category == .animal {
            return (
                "A biological organism with sensory organs, specialized muscle movement, and instinctive behavior.",
                "This is an animal or pet that interacts dynamically with its environment through sight, smell, and sound.",
                "Think of their senses like high-sensitivity biological radar.",
                "Many animals have senses far beyond humans, such as hearing ultrasonic frequencies or sensing magnetic fields!",
                [
                    "What is this animal's natural habitat?",
                    "How does its vision differ from human vision?",
                    "What does this animal typically eat?"
                ]
            )
        }

        // Default Object Generator
        return (
            "A physical \(subject.lowercased()) identified in your visual field with distinct shape, texture, and structural characteristics.",
            "Your camera recognized this as a \(subject). It serves a specific functional or decorative purpose.",
            "Think of it like a specialized tool designed to meet a particular daily need.",
            "Every manufactured item undergoes design prototyping, material selection, and quality testing before production!",
            [
                "How was this item manufactured?",
                "What materials were used to construct it?",
                "What is the history behind this design?"
            ]
        )
    }
}
