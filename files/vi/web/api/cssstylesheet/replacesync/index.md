---
title: "CSSStyleSheet: replaceSync() method"
short-title: replaceSync()
slug: Web/API/CSSStyleSheet/replaceSync
page-type: web-api-instance-method
browser-compat: api.CSSStyleSheet.replaceSync
---

{{APIRef("CSSOM")}}

Phương thức **`replaceSync()`** của giao diện {{domxref("CSSStyleSheet")}} thay thế đồng bộ nội dung của bảng kiểu với nội dung được truyền vào.

Các phương thức `replaceSync()` và {{domxref("CSSStyleSheet.replace()")}} chỉ có thể được sử dụng trên một bảng kiểu được tạo bằng hàm khởi tạo {{domxref("CSSStyleSheet.CSSStyleSheet()","CSSStyleSheet()")}}.

## Cú pháp

```js-nolint
replaceSync(text)
```

### Tham số

- `text`
  - : Một chuỗi chứa các quy tắc kiểu dáng để thay thế nội dung của bảng kiểu. Nếu chuỗi không chứa một danh sách quy tắc có thể phân tích cú pháp, thì giá trị sẽ được đặt thành một chuỗi rỗng.

    > [!NOTE]
    > Nếu bất kỳ quy tắc nào được truyền trong `text` là một bảng kiểu bên ngoài được nhập bằng quy tắc {{cssxref("@import")}}, những quy tắc đó sẽ bị xóa và một cảnh báo sẽ được in ra console.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu bảng kiểu không được tạo bằng hàm khởi tạo {{domxref("CSSStyleSheet.CSSStyleSheet()","CSSStyleSheet()")}} hoặc nếu bảng kiểu được đánh dấu là không thể sửa đổi.

## Ví dụ

Trong ví dụ sau, một bảng kiểu mới được tạo và hai quy tắc CSS được thêm bằng `replaceSync`.

```js
const stylesheet = new CSSStyleSheet();

stylesheet.replaceSync("body { font-size: 1.4em; } p { color: red; }");
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Using the Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
