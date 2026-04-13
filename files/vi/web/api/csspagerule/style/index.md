---
title: "CSSPageRule: thuộc tính style"
short-title: style
slug: Web/API/CSSPageRule/style
page-type: web-api-instance-property
browser-compat: api.CSSPageRule.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSPageRule")}} chứa một đối tượng {{domxref("CSSPageDescriptors")}} biểu thị các descriptor có sẵn trong nội dung quy tắc {{cssxref("@page")}}.

## Giá trị

Một đối tượng {{domxref("CSSPageDescriptors")}}.

> [!NOTE]
> Các phiên bản trước của đặc tả định nghĩa thuộc tính này là {{domxref("CSSStyleDeclaration")}}. Kiểm tra dữ liệu tương thích bên dưới cho trình duyệt của bạn.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSPageDescriptors`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSPageDescriptors` bằng cách sử dụng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

### Kiểm tra quy tắc trang

Ví dụ này sử dụng Web API để kiểm tra nội dung của quy tắc {{cssxref("@page")}}.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```css hidden
#log {
  height: 230px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### CSS

Bên dưới chúng ta định nghĩa các kiểu cho trang bằng quy tắc {{cssxref("@page")}}. Chúng ta gán các giá trị khác nhau cho mỗi thuộc tính margin bằng cách sử dụng viết tắt `margin`, và cũng chỉ định `size`. Chúng ta không đặt `page-orientation`.

```css
@page {
  margin: 1cm 2px 3px 4px;
  /* page-orientation: upright; */
  size: A4;
}
```

#### JavaScript

Cơ sở hạ tầng [live sample](/en-US/docs/MDN/Writing_guidelines/Page_structures/Live_samples) của MDN kết hợp tất cả các khối CSS trong ví dụ thành một style nội tuyến với id `css-output`, vì vậy trước tiên chúng ta sử dụng {{domxref("document.getElementById()")}} để tìm sheet đó.

```js
const myRules = document.getElementById("css-output").sheet.cssRules;
```

Sau đó chúng ta lặp qua các quy tắc được định nghĩa cho ví dụ live và khớp bất kỳ quy tắc nào thuộc loại `CSSPageRule`, vì chúng tương ứng với các quy tắc `@page`. Đối với các đối tượng khớp, chúng ta ghi lại `style` và tất cả các giá trị của nó.

```js
for (const rule of myRules) {
  if (rule instanceof CSSPageRule) {
    log(`${rule.style}`);
    log(`margin: ${rule.style.margin}`);

    // Access properties using CamelCase properties
    log(`marginTop: ${rule.style.marginTop}`);
    log(`marginRight: ${rule.style.marginRight}`);
    log(`marginBottom: ${rule.style.marginBottom}`);
    log(`marginLeft: ${rule.style.marginLeft}`);
    log(`pageOrientation: ${rule.style.pageOrientation}`);

    // Access properties using snake-case properties
    log(`margin-top: ${rule.style["margin-top"]}`);
    log(`margin-right: ${rule.style["margin-right"]}`);
    log(`margin-left: ${rule.style["margin-left"]}`);
    log(`margin-bottom: ${rule.style["margin-bottom"]}`);
    log(`page-orientation: ${rule.style["page-orientation"]}`);

    log(`size: ${rule.style.size}`);
    log("\n");
  }
}
```

#### Kết quả

Kết quả được hiển thị bên dưới.

{{EmbedLiveSample("Inspecting a page rule", "100%", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
