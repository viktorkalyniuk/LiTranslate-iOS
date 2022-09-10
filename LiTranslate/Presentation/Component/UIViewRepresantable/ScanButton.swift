//
//  ScanButton.swift
//  LiTranslate
//
//  Thanks for the guide:
//  https://www.raywenderlich.com/28189776-capturing-text-from-camera-using-swiftui
//

import SwiftUI

struct ScanButton: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> some UIView {
        let textFromCamera = UIAction.captureTextFromCamera(
          responder: context.coordinator,
          identifier: nil)

        let button = UIButton(primaryAction: textFromCamera)
        button.setImage(UIImage(systemName: SystemNames.cameraScan), for: .normal)
        button.setTitle("", for: .normal)
        button.menu = UIMenu(children: [textFromCamera])

        return button
    }

    func updateUIView(_ uiView: UIViewType, context: Context) { }

    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }

    class Coordinator: UIResponder, UIKeyInput {
      let parent: ScanButton
      init(_ parent: ScanButton) { self.parent = parent }

      var hasText = false
      func insertText(_ text: String) { parent.text = text }
      func deleteBackward() { }
    }
}

struct ScanButton_Previews: PreviewProvider {
    static var previews: some View {
        ScanButton(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
