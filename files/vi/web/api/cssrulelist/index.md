---
title: CSSRuleList
slug: Web/API/CSSRuleList
page-type: web-api-interface
browser-compat: api.CSSRuleList
---

{{ APIRef("CSSOM") }}

`CSSRuleList` biểu thị một tập hợp có thứ tự các đối tượng {{domxref("CSSRule")}} chỉ đọc.

Mặc dù đối tượng `CSSRuleList` là chỉ đọc và không thể được sửa đổi trực tiếp, nó được coi là đối tượng `live`, vì nội dung có thể thay đổi theo thời gian.

Để chỉnh sửa các quy tắc cơ bản được trả về bởi các đối tượng `CSSRule`, sử dụng {{domxref("CSSStyleSheet.insertRule()")}} và {{domxref("CSSStyleSheet.deleteRule()")}}, là các phương thức của {{domxref("CSSStyleSheet")}}.

Giao diện này là [nỗ lực tạo danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ tiếp tục được hỗ trợ để không phá vỡ code đã sử dụng nó. Các API hiện đại biểu thị cấu trúc danh sách bằng các loại dựa trên [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) JavaScript, do đó cung cấp nhiều phương thức mảng, đồng thời áp đặt các ngữ nghĩa bổ sung về việc sử dụng chúng (chẳng hạn như làm cho các mục của chúng chỉ đọc).

Những lý do lịch sử này không có nghĩa là bạn với tư cách là nhà phát triển nên tránh `CSSRuleList`. Bạn không tự tạo đối tượng `CSSRuleList`, mà lấy chúng từ các API như {{domxref("CSSStyleSheet.cssRules")}} và {{domxref("CSSKeyframesRule.cssRules")}}, và các API này không bị lỗi thời. Tuy nhiên, hãy cẩn thận về sự khác biệt ngữ nghĩa so với mảng thực.

## Thuộc tính phiên bản

- {{domxref("CSSRuleList.length")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên biểu thị số lượng đối tượng {{domxref("CSSRule")}} trong tập hợp.

## Phương thức phiên bản

- {{domxref("CSSRuleList.item()")}}
  - : Lấy một {{domxref("CSSRule")}} đơn lẻ.

## Ví dụ

Trong ví dụ sau có một stylesheet với ba quy tắc. Sử dụng {{domxref("CSSStyleSheet.cssRules")}} trả về `CSSRuleList`, được in ra console.

Số lượng quy tắc trong danh sách được in ra console bằng {{domxref("CSSRuleList.length")}}. {{domxref("CSSRule")}} đầu tiên có thể được trả về bằng cách sử dụng `0` làm tham số cho {{domxref("CSSRuleList.item")}}, trong ví dụ này sẽ trả về các quy tắc được đặt cho bộ chọn `body`.

### CSS

```css
body {
  font-family:
    system-ui,
    -apple-system,
    sans-serif;
  margin: 2em;
}

.container {
  display: grid;
  grid-template-columns: repeat(auto-fill, 200px);
}

.container > * {
  background-color: #3740ff;
  color: white;
}
```

### JavaScript

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules);
console.log(myRules.length);
console.log(myRules[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`CSSRule`](/en-US/docs/Web/API/CSSRule)
