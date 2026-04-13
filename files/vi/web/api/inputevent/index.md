---
title: InputEvent
slug: Web/API/InputEvent
page-type: web-api-interface
browser-compat: api.InputEvent
---

{{APIRef("UI Events")}}

Giao diện **`InputEvent`** biểu diễn một sự kiện thông báo cho người dùng về các thay đổi đối với nội dung có thể chỉnh sửa.

{{InheritanceDiagram}}

## Constructor

- {{DOMxRef("InputEvent.InputEvent", "InputEvent()")}}
  - : Tạo một đối tượng `InputEvent`.

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ cha của nó, {{DOMxRef("UIEvent")}} và {{DOMxRef("Event")}}._

- {{DOMxRef("InputEvent.data")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi với các ký tự đã chèn. Đây có thể là một chuỗi rỗng nếu thay đổi không chèn văn bản (ví dụ, khi xóa ký tự).
- {{DOMxRef("InputEvent.dataTransfer")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("DataTransfer")}} chứa thông tin về dữ liệu văn bản giàu định dạng hoặc văn bản thuần túy đang được thêm vào hoặc xóa khỏi nội dung có thể chỉnh sửa.
- {{DOMxRef("InputEvent.inputType")}} {{ReadOnlyInline}}
  - : Trả về loại thay đổi đối với nội dung có thể chỉnh sửa như, ví dụ, chèn, xóa hoặc định dạng văn bản.
- {{DOMxRef("InputEvent.isComposing")}} {{ReadOnlyInline}}
  - : Trả về một giá trị {{JSxRef("Boolean")}} cho biết sự kiện có được kích hoạt sau {{domxref("Element/compositionstart_event", "compositionstart")}} và trước {{domxref("Element/compositionend_event", "compositionend")}} hay không.

## Phương thức instance

_Giao diện này kế thừa các phương thức từ cha của nó, {{DOMxRef("UIEvent")}} và {{DOMxRef("Event")}}._

- {{DOMxRef('InputEvent.getTargetRanges()')}}
  - : Trả về một mảng các đối tượng {{domxref("StaticRange")}} sẽ bị ảnh hưởng bởi một thay đổi đối với DOM nếu sự kiện đầu vào không bị hủy.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện `beforeinput`](/en-US/docs/Web/API/Element/beforeinput_event)
- [Sự kiện `input`](/en-US/docs/Web/API/Element/input_event)
