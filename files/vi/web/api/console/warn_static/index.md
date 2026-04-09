---
title: "console: phương thức tĩnh warn()"
short-title: warn()
slug: Web/API/console/warn_static
page-type: web-api-static-method
browser-compat: api.console.warn_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.warn()`** xuất một thông báo cảnh báo ra console ở mức nhật ký "warning". Thông báo chỉ được hiển thị cho người dùng nếu console được cấu hình để hiển thị đầu ra cảnh báo. Trong hầu hết trường hợp, mức nhật ký được cấu hình trong giao diện console. Thông báo có thể nhận được định dạng đặc biệt, chẳng hạn như màu vàng và biểu tượng cảnh báo.

## Cú pháp

```js-nolint
console.warn(val1)
console.warn(val1, /* …, */ valN)
console.warn(msg)
console.warn(msg, subst1, /* …, */ substN)
```

### Tham số

- `val1` … `valN`
  - : Danh sách các giá trị JavaScript cần xuất. Biểu diễn của từng giá trị sẽ được xuất ra console theo đúng thứ tự, với một dạng phân tách nào đó giữa chúng. Có một trường hợp đặc biệt nếu `val1` là chuỗi, được mô tả ngay sau đây.
- `msg`
  - : Một chuỗi JavaScript chứa không hoặc nhiều chuỗi thay thế; các chuỗi này được thay bằng `subst1` đến `substN` theo thứ tự liên tiếp cho đến số lượng chuỗi thay thế. Xem [Dùng chuỗi thay thế](/en-US/docs/Web/API/console#using_string_substitutions) để biết cách hoạt động của việc thay thế.
- `subst1` … `substN`
  - : Các giá trị JavaScript dùng để thay thế các chuỗi thay thế trong `msg`. Nếu có nhiều giá trị thay thế hơn số chuỗi thay thế, các giá trị dư ra cũng sẽ được ghi vào console theo cùng cách như khi không có chuỗi định dạng.

Xem [Xuất văn bản ra console](/en-US/docs/Web/API/console#outputting_text_to_the_console) trong tài liệu của {{domxref("console")}} để biết thêm chi tiết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.warn()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#warn)
- [Tài liệu của Node.js về `console.warn()`](https://nodejs.org/docs/latest/api/console.html#consolewarndata-args)
- [Tài liệu của Google Chrome về `console.warn()`](https://developer.chrome.com/docs/devtools/console/api/#warn)
