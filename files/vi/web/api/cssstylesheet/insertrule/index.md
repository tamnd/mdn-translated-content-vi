---
title: "CSSStyleSheet: insertRule() method"
short-title: insertRule()
slug: Web/API/CSSStyleSheet/insertRule
page-type: web-api-instance-method
browser-compat: api.CSSStyleSheet.insertRule
---

{{APIRef("CSSOM")}}

Phương thức **`CSSStyleSheet.insertRule()`** chèn một [CSS rule](/en-US/docs/Web/API/CSSRule) mới vào [bảng kiểu hiện tại](/en-US/docs/Web/API/CSSStyleSheet).

> [!NOTE]
> Mặc dù `insertRule()` là phương thức riêng của
> {{domxref("CSSStyleSheet")}}, nó thực sự chèn quy tắc vào
> `{{domxref("CSSStyleSheet", "", "", "1")}}.cssRules` — {{domxref("CSSRuleList")}} nội bộ của nó.

## Cú pháp

```js-nolint
insertRule(rule)
insertRule(rule, index)
```

### Tham số

- `rule`
  - : Một chuỗi chứa quy tắc cần chèn. Nội dung quy tắc cần chèn phụ thuộc vào loại của nó:
    - **Đối với [rule-sets](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_statements)**, cần cả [bộ chọn](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) và một khai báo kiểu dáng.
    - **Đối với [at-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)**, cần cả định danh at-rule và nội dung quy tắc.

- `index` {{optional_inline}}
  - : Một số nguyên dương nhỏ hơn hoặc bằng `stylesheet.cssRules.length`, đại diện cho vị trí của quy tắc mới được chèn trong `{{domxref("CSSStyleSheet", "", "", "1")}}.cssRules`. Mặc định là `0`. (Trong các triển khai cũ hơn, tham số này là bắt buộc. Xem [Browser compatibility](#browser_compatibility) để biết chi tiết.)

### Giá trị trả về

Chỉ số của quy tắc mới được chèn trong danh sách quy tắc của bảng kiểu.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `index` > `{{domxref("CSSRuleList", "", "", "1")}}.length`.
- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Được ném ra nếu `rule` không thể được chèn tại vị trí chỉ định do một số ràng buộc CSS; ví dụ: cố gắng chèn một {{cssxref("@import")}} at-rule sau một style rule.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu có nhiều hơn một quy tắc được truyền trong tham số `rule`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `rule` là {{cssxref("@namespace")}} và [danh sách quy tắc](/en-US/docs/Web/CSS/Reference/Values/rule-list) chứa các at-rule khác ngoài {{cssxref("@import")}} và {{cssxref("@namespace")}} at-rules.

## Ví dụ

### Chèn một quy tắc mới

Đoạn mã này đẩy một quy tắc mới lên đầu bảng kiểu của tôi.

```js
myStyle.insertRule("#blanc { color: white }", 0);
```

### Hàm để thêm quy tắc bảng kiểu

```js
/**
 * Thêm một quy tắc bảng kiểu vào tài liệu (có thể thực hành tốt hơn
 * là thay đổi các lớp động, để thông tin kiểu dáng có thể được giữ trong
 * các bảng kiểu thực tế và tránh thêm phần tử thừa vào DOM).
 * Lưu ý rằng cần một mảng cho các khai báo và quy tắc vì ECMAScript không
 * đảm bảo thứ tự lặp đối tượng có thể đoán trước, và vì CSS
 * phụ thuộc vào thứ tự.
 * @param {Array} rules Chấp nhận một mảng các khai báo được mã hóa JSON
 * @example
addStylesheetRules([
  ['h2', // Cũng chấp nhận đối số thứ hai là một mảng các mảng thay thế
    ['color', 'red'],
    ['background-color', 'green', true] // 'true' cho các quy tắc !important
  ],
  ['.myClass',
    ['background-color', 'yellow']
  ]
]);
*/
function addStylesheetRules(rules) {
  const styleEl = document.createElement("style");

  // Nối phần tử <style> vào <head>
  document.head.appendChild(styleEl);

  // Lấy sheet của phần tử style
  const styleSheet = styleEl.sheet;

  for (let rule of rules) {
    let i = 1,
      selector = rule[0],
      propStr = "";
    // Nếu đối số thứ hai của một rule là một mảng các mảng, điều chỉnh các biến.
    if (Array.isArray(rule[1][0])) {
      rule = rule[1];
      i = 0;
    }

    for (; i < rule.length; i++) {
      const prop = rule[i];
      propStr += `${prop[0]}: ${prop[1]}${prop[2] ? " !important" : ""};\n`;
    }

    // Chèn CSS Rule
    styleSheet.insertRule(
      `${selector}{${propStr}}`,
      styleSheet.cssRules.length,
    );
  }
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("CSSStyleSheet.deleteRule")}}
- [Constructable Stylesheets](https://web.dev/articles/constructable-stylesheets) (web.dev)
