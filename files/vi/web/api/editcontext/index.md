---
title: EditContext
slug: Web/API/EditContext
page-type: web-api-interface
status:
  - experimental
browser-compat: api.EditContext
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Giao diện **`EditContext`** đại diện cho ngữ cảnh chỉnh sửa văn bản của một phần tử được làm cho có thể chỉnh sửa bằng cách sử dụng {{domxref("EditContext API", "", "", "nocode")}}.

{{domxref("EditContext API", "", "", "nocode")}} có thể được dùng để xây dựng các trình soạn thảo văn bản phong phú trên web hỗ trợ các trải nghiệm nhập văn bản nâng cao, chẳng hạn như soạn thảo {{glossary("Input Method Editor")}} (IME), bộ chọn emoji, hoặc bất kỳ giao diện người dùng liên quan đến chỉnh sửa nào khác của nền tảng.

## Hàm khởi tạo

- {{domxref("EditContext.EditContext", "EditContext()")}} {{experimental_inline}}
  - : Trả về một thực thể `EditContext` mới.

## Thuộc tính phiên bản

- {{domxref("EditContext.text")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Nội dung văn bản có thể chỉnh sửa của phần tử.
- {{domxref("EditContext.selectionStart")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Độ lệch, trong nội dung văn bản có thể chỉnh sửa, của điểm bắt đầu vùng chọn hiện tại.
- {{domxref("EditContext.selectionEnd")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Độ lệch, trong nội dung văn bản có thể chỉnh sửa, của điểm kết thúc vùng chọn hiện tại.
- {{domxref("EditContext.characterBoundsRangeStart")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Độ lệch, trong nội dung văn bản có thể chỉnh sửa, nơi mà lần soạn thảo IME gần nhất bắt đầu.

## Phương thức phiên bản

_`EditContext` dựa trên giao diện {{domxref("EventTarget")}} và bao gồm các phương thức của nó._

- {{domxref("EditContext.attachedElements()")}} {{experimental_inline}}
  - : Một {{jsxref("Array")}} chứa một đối tượng {{domxref("HTMLElement")}} là phần tử được liên kết với đối tượng `EditContext`.
- {{domxref("EditContext.characterBounds()")}} {{experimental_inline}}
  - : Danh sách hình chữ nhật bao quanh các ký tự trong đối tượng `EditContext`.
- {{domxref("EditContext.updateText()")}} {{experimental_inline}}
  - : Cập nhật nội dung văn bản nội bộ của đối tượng `EditContext`.
- {{domxref("EditContext.updateSelection()")}} {{experimental_inline}}
  - : Cập nhật trạng thái nội bộ của vùng chọn trong ngữ cảnh văn bản có thể chỉnh sửa.
- {{domxref("EditContext.updateControlBounds()")}} {{experimental_inline}}
  - : Thông báo cho hệ điều hành về vị trí và kích thước của vùng văn bản có thể chỉnh sửa.
- {{domxref("EditContext.updateSelectionBounds()")}} {{experimental_inline}}
  - : Thông báo cho hệ điều hành về vị trí và kích thước của vùng chọn trong vùng văn bản có thể chỉnh sửa.
- {{domxref("EditContext.updateCharacterBounds()")}} {{experimental_inline}}
  - : Thông báo cho hệ điều hành về vị trí và kích thước của các ký tự trong đối tượng `EditContext`.

## Sự kiện

- {{domxref("EditContext.textupdate_event", "textupdate")}} {{experimental_inline}}
  - : Được kích hoạt khi người dùng thực hiện thay đổi đối với văn bản hoặc vùng chọn.
- {{domxref("EditContext.textformatupdate_event", "textformatupdate")}} {{experimental_inline}}
  - : Được kích hoạt khi đang soạn thảo bằng cửa sổ {{glossary("Input Method Editor")}} (IME) và IME quyết định rằng một số phần văn bản đang được soạn thảo cần được định dạng khác nhau để chỉ ra trạng thái soạn thảo.
- {{domxref("EditContext.characterboundsupdate_event", "characterboundsupdate")}} {{experimental_inline}}
  - : Được kích hoạt khi hệ điều hành cần biết kích thước và vị trí của một số ký tự trong vùng văn bản có thể chỉnh sửa của đối tượng `EditContext`, nhằm hiển thị cửa sổ IME.
- {{domxref("EditContext.compositionstart_event", "compositionstart")}} {{experimental_inline}}
  - : Được kích hoạt khi bắt đầu soạn thảo bằng cửa sổ IME.
- {{domxref("EditContext.compositionend_event", "compositionend")}} {{experimental_inline}}
  - : Được kích hoạt khi kết thúc soạn thảo bằng cửa sổ IME.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
