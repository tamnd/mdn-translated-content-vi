---
title: "KeyboardEvent: thuộc tính charCode"
short-title: charCode
slug: Web/API/KeyboardEvent/charCode
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.KeyboardEvent.charCode
---

{{APIRef("UI Events")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc **`charCode`** của giao diện
{{domxref("KeyboardEvent")}} trả về giá trị Unicode của phím ký tự
được nhấn trong sự kiện {{domxref("Element/keypress_event", "keypress")}}.

> [!WARNING]
> Không sử dụng thuộc tính này, vì nó đã bị loại bỏ. Thay vào đó, hãy lấy
> giá trị Unicode của ký tự bằng thuộc tính {{domxref("KeyboardEvent.key", "key")}}.

## Giá trị

Một số biểu diễn giá trị Unicode của phím ký tự đã nhấn.

## Ví dụ

### HTML

```html
<p>Nhập bất kỳ nội dung nào vào ô nhập bên dưới để ghi lại <code>charCode</code>.</p>
<input type="text" />
<p id="log"></p>
```

### JavaScript

```js
const input = document.querySelector("input");
const log = document.querySelector("#log");

input.addEventListener("keypress", (e) => {
  log.innerText = `Phím đã nhấn: ${String.fromCharCode(e.charCode)}\ncharCode: ${
    e.charCode
  }`;
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Ghi chú

- Trong sự kiện {{domxref("Element/keypress_event", "keypress")}}, giá trị Unicode của phím được nhấn được lưu trữ trong
  thuộc tính {{ domxref("KeyboardEvent.keyCode", "keyCode") }} hoặc `charCode`, nhưng không bao giờ cả hai. Nếu phím được nhấn tạo ra một ký tự (ví dụ: 'a'),
  `charCode` được đặt thành mã của ký tự đó; `charCode`
  phân biệt chữ hoa chữ thường (nói cách khác, `charCode` tính đến
  việc phím <kbd>shift</kbd> có được giữ hay không). Nếu không, mã của phím được nhấn
  được lưu trữ trong `keyCode`.
- `charCode` không bao giờ được đặt trong các sự kiện {{domxref("Element/keydown_event", "keydown")}} và
  {{domxref("Element/keyup_event", "keyup")}}. Trong những trường hợp này, `keyCode` được đặt thay thế.
- Để lấy mã của phím bất kể nó được lưu trữ trong
  `keyCode` hay `charCode`, hãy truy vấn thuộc tính {{domxref("UIEvent/which", "which")}}.
- Các ký tự được nhập thông qua {{glossary("Input method editor")}} không được ghi nhận qua `keyCode` hoặc
  `charCode`.
- Để xem danh sách các giá trị `charCode` được liên kết với các phím cụ thể, hãy chạy
  [Hiển thị các thuộc tính của đối tượng sự kiện](/en-US/docs/Web/API/Document_Object_Model#displaying_event_object_properties) và xem bảng HTML kết quả.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
