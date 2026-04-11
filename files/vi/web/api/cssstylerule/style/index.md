---
title: "CSSStyleRule: style property"
short-title: style
slug: Web/API/CSSStyleRule/style
page-type: web-api-instance-property
browser-compat: api.CSSStyleRule.style
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ-đọc **`style`** của giao diện {{domxref("CSSStyleRule")}} chứa một đối tượng {{domxref("CSSStyleProperties")}} đại diện cho danh sách thuộc tính trong phần thân của style rule này.

Mỗi [thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties) được trình duyệt hỗ trợ đều có mặt trên đối tượng.
Các thuộc tính không được định nghĩa inline trong khai báo CSS tương ứng sẽ được đặt thành chuỗi rỗng (`""`).

## Giá trị

Một đối tượng {{domxref("CSSStyleProperties")}}.

> [!NOTE]
> Các phiên bản trước của đặc tả trả về một {{domxref("CSSStyleDeclaration")}}, hiện là lớp cơ sở của {{domxref("CSSStyleProperties")}}.
> Xem bảng [tương thích trình duyệt](#browser_compatibility) để biết thông tin hỗ trợ trình duyệt.

Mặc dù bản thân thuộc tính `style` là chỉ-đọc theo nghĩa là bạn không thể thay thế đối tượng `CSSStyleProperties`, bạn vẫn có thể gán trực tiếp vào thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleProperties` bằng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

### Lấy các style của một style rule

CSS dưới đây định nghĩa style rule cho bộ chọn `h1`, được biểu diễn trong code bằng một thể hiện {{domxref("CSSStyleRule")}}.
Khối khai báo là phần của style rule xuất hiện bên trong dấu ngoặc nhọn và thực sự cung cấp các định nghĩa style cho bộ chọn, được biểu diễn trong code bằng thuộc tính `style`.

```css
h1 {
  color: pink;
}
```

Giả sử style rule ở trên là quy tắc đầu tiên trong tài liệu, nó sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0].style` trả về một đối tượng {{domxref("CSSStyleProperties")}} đại diện cho các khai báo được định nghĩa cho `h1`.

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].style); // a CSSStyleProperties representing the declarations on the h1.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
