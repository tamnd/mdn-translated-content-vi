---
title: Kích hoạt của người dùng
slug: Web/Security/Defenses/User_activation
page-type: guide
sidebar: security
---

Để bảo đảm các ứng dụng không thể lạm dụng những API có thể tạo ra trải nghiệm người dùng tệ khi hành vi đó không mong muốn, một số API chỉ có thể được dùng khi người dùng đang ở trạng thái "tương tác chủ động", nghĩa là người dùng hiện đang tương tác với trang web, hoặc đã tương tác với trang ít nhất một lần.
Trình duyệt giới hạn quyền truy cập vào các API nhạy cảm như popup, toàn màn hình hoặc rung cho các tương tác chủ động của người dùng để ngăn các script độc hại lạm dụng các tính năng này.
Trang này liệt kê các tính năng của nền tảng web chỉ khả dụng sau khi có kích hoạt của người dùng.

Kích hoạt của người dùng ngụ ý rằng người dùng hiện đang tương tác với trang, hoặc đã hoàn tất một tương tác kể từ khi trang được tải.
Thông thường, đó là một cú nhấp vào nút hoặc một tương tác khác với giao diện người dùng.

Chính xác hơn, một _sự kiện đầu vào kích hoạt_ là một sự kiện:

- có thuộc tính [`isTrusted`](/en-US/docs/Web/API/Event/isTrusted) được đặt thành `true`, và
- là một trong các loại sau:
  - [`keydown`](/en-US/docs/Web/API/Element/keydown_event) (trừ phím <kbd>Esc</kbd>, các phím tắt dành riêng cho trình duyệt, và một số phím không tạo kích hoạt của người dùng, vốn thay đổi theo bàn phím, như <kbd>Caps Lock</kbd>, <kbd>Num Lock</kbd>, và <kbd>Print Screen</kbd>. Hành vi có thể khác nhau giữa các trình duyệt.

  - [`mousedown`](/en-US/docs/Web/API/Element/mousedown_event)
  - [`pointerdown`](/en-US/docs/Web/API/Element/pointerdown_event) (nếu `pointerType` là "mouse")
  - [`pointerup`](/en-US/docs/Web/API/Element/pointerup_event) (nếu `pointerType` không phải là "mouse")
  - [`touchend`](/en-US/docs/Web/API/Element/touchend_event)

Nếu một kích hoạt đã được kích hoạt, user agent phân biệt giữa hai trạng thái cửa sổ kích hoạt của người dùng: sticky và transient.

## So sánh giữa transient và sticky activation

Sự khác nhau giữa transient và sticky activation là transient activation chỉ kéo dài trong một thời gian ngắn, và trong một số trường hợp có thể bị tiêu thụ (deactivated) khi một tính năng được bảo vệ được dùng, trong khi sticky activation tồn tại cho đến hết phiên làm việc.

Việc giới hạn tính năng bằng transient activation bảo đảm rằng chúng chỉ khả dụng nếu được người dùng kích hoạt trực tiếp.
Ngược lại, sticky activation chủ yếu được dùng để hạn chế các tính năng không nên tự động kích hoạt khi tải trang, chẳng hạn popup.

## Transient activation

{{Glossary("Transient activation")}} là một trạng thái cửa sổ cho biết người dùng gần đây đã nhấn nút hoặc thực hiện một tương tác người dùng khác.
Transient activation hết hạn sau một khoảng thời gian chờ (nếu không được gia hạn bởi tương tác tiếp theo) và cũng có thể bị một số API tiêu thụ (như {{domxref("Window.open()")}}).

Các API yêu cầu transient activation (danh sách không đầy đủ):

- {{domxref("Clients.openWindow()")}}
- {{domxref("Clipboard.read()")}}
- {{domxref("Clipboard.readText()")}}
- {{domxref("Clipboard.write()")}}
- {{domxref("Clipboard.writeText()")}}
- {{domxref("ContactsManager.select()")}}
- {{domxref("Document.requestStorageAccess()")}}
- {{domxref("DocumentPictureInPicture.requestWindow()")}}
- {{domxref("Element.requestFullScreen()")}}
- {{domxref("Element.requestPointerLock()")}}
- {{domxref("EyeDropper.open()")}}
- {{domxref("HID.requestDevice()")}}
- {{domxref("HTMLInputElement.showPicker()")}}
- {{domxref("HTMLSelectElement.showPicker()")}}
- {{domxref("HTMLVideoElement.requestPictureInPicture()")}}
- {{domxref("IdleDetector/requestPermission_static", "IdleDetector.requestPermission()")}}
- {{domxref("Keyboard.lock()")}}
- {{domxref("MediaDevices.getDisplayMedia()")}}
- `MediaDevices.getViewportMedia()`
- {{domxref("MediaDevices.selectAudioOutput()")}}
- `MediaStreamTrack.sendCaptureAction()`
- {{domxref("Navigator.share()")}}
- {{domxref("PaymentRequest.show()")}}
- {{domxref("PresentationRequest.start()")}}
- {{domxref("RemotePlayback.prompt()")}}
- {{domxref("Serial.requestPort()")}}
- {{domxref("USB.requestDevice()")}}
- {{domxref("Window.getScreenDetails()")}}
- {{domxref("Window.open()")}}
- {{domxref("Window.queryLocalFonts()")}}
- {{domxref("Window.showDirectoryPicker()")}}
- {{domxref("Window.showOpenFilePicker()")}}
- {{domxref("Window.showSaveFilePicker()")}}
- {{domxref("WindowClient.focus()")}}
- {{domxref("XRSystem.requestSession()")}}

## Sticky activation

{{Glossary("Sticky activation")}} là một trạng thái cửa sổ cho biết trong một thời điểm nào đó của phiên, người dùng đã nhấn một nút, dùng một menu, hoặc thực hiện một tương tác người dùng khác.
Trạng thái này không được đặt lại sau khi đã được thiết lập lần đầu (khác với transient activation).

Các API yêu cầu sticky activation (không đầy đủ):

- sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}}
- {{domxref("Navigator.vibrate()")}}
- {{domxref("VirtualKeyboard.show()")}}
- Tự phát của [Media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay) (đặc biệt là đối với [`AudioContexts`](/en-US/docs/Web/API/AudioContext)).
- các sự kiện {{domxref("Clipboard.clipboardchange_event", "clipboardchange")}} (các sự kiện này cũng có thể được bật nếu người dùng cấp quyền `clipboard-read`).

## UserActivation API

Để xác định bằng chương trình liệu một cửa sổ có sticky hay transient user activation hay không, API {{domxref("UserActivation")}} cung cấp hai thuộc tính có thể truy cập qua {{domxref("navigator.userActivation")}}:

- {{domxref("UserActivation.hasBeenActive")}} cho biết liệu cửa sổ có sticky user activation hay không.
- {{domxref("UserActivation.isActive")}} cho biết liệu cửa sổ có transient user activation hay không.

## Xem thêm

- {{Glossary("Transient activation")}}
- {{Glossary("Sticky activation")}}
- API {{domxref("UserActivation")}}
- [Các tính năng bị giới hạn cho secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts)
