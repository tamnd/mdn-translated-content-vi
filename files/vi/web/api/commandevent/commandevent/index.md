---
title: "CommandEvent: hàm tạo CommandEvent()"
short-title: CommandEvent()
slug: Web/API/CommandEvent/CommandEvent
page-type: web-api-constructor
browser-compat: api.CommandEvent.CommandEvent
---

{{APIRef("Invoker Commands API")}}

Hàm tạo **`CommandEvent()`** tạo một đối tượng {{domxref("CommandEvent")}} mới.

## Cú pháp

```js-nolint
new CommandEvent(type)
new CommandEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt giá trị này thành `command`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `source` {{optional_inline}}
      - : Một {{domxref("HTMLButtonElement")}} biểu diễn nút đã được tương tác để gây ra sự kiện này. Đây có thể là bất kỳ phần tử nào nhưng chúng tôi khuyên bạn chỉ nên dùng nút làm nguồn để tránh những hành vi bất ngờ.
    - `command` {{optional_inline}}
      - : Một chuỗi chứa lệnh mà phần tử được điều khiển phải thực hiện. Khi khởi tạo `CommandEvent` theo cách thủ công, bạn có thể dùng bất kỳ giá trị chuỗi nào, nhưng bạn nên dùng một trong các tên dựng sẵn hoặc thêm tiền tố hai dấu gạch ngang (`--`) để bảo đảm khả năng tương thích về sau.

### Giá trị trả về

Một đối tượng {{domxref("CommandEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.command")}}
- {{domxref("HTMLButtonElement.commandForElement")}}
- {{domxref("CommandEvent")}}
