---
title: "CSSStyleSheet: replace() method"
short-title: replace()
slug: Web/API/CSSStyleSheet/replace
page-type: web-api-instance-method
browser-compat: api.CSSStyleSheet.replace
---

{{APIRef("CSSOM")}}

Phương thức **`replace()`** của giao diện {{domxref("CSSStyleSheet")}} thay thế bất đồng bộ nội dung của bảng kiểu với nội dung được truyền vào. Phương thức trả về một promise giải quyết với đối tượng `CSSStyleSheet`.

Các phương thức `replace()` và {{domxref("CSSStyleSheet.replaceSync()")}} chỉ có thể được sử dụng trên một bảng kiểu được tạo bằng hàm khởi tạo {{domxref("CSSStyleSheet.CSSStyleSheet()","CSSStyleSheet()")}}.

## Cú pháp

```js-nolint
replace(text)
```

### Tham số

- `text`
  - : Một chuỗi chứa các quy tắc kiểu dáng để thay thế nội dung của bảng kiểu. Nếu chuỗi không chứa một danh sách quy tắc có thể phân tích cú pháp, thì giá trị sẽ được đặt thành một chuỗi rỗng.

    > [!NOTE]
    > Nếu bất kỳ quy tắc nào được truyền trong `text` là một bảng kiểu bên ngoài được nhập bằng quy tắc {{cssxref("@import")}}, những quy tắc đó sẽ bị xóa và một cảnh báo sẽ được in ra console.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với {{domxref("CSSStyleSheet")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu một trong hai điều kiện sau được đáp ứng:
    - Bảng kiểu không được tạo bằng hàm khởi tạo {{domxref("CSSStyleSheet.CSSStyleSheet()","CSSStyleSheet()")}}.
    - Bảng kiểu được đánh dấu là không thể sửa đổi.

## Ví dụ

Trong ví dụ sau, một bảng kiểu mới được tạo và hai quy tắc CSS được thêm bằng `replace()`. Quy tắc đầu tiên sau đó được in ra console, sẽ trả về: `body { font-size: 1.4em; }`

```js
const stylesheet = new CSSStyleSheet();

stylesheet
  .replace("body { font-size: 1.4em; } p { color: red; }")
  .then(() => {
    console.log(stylesheet.cssRules[0].cssText);
  })
  .catch((err) => {
    console.error("Không thể thay thế kiểu dáng:", err);
  });
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
- [Using the Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
