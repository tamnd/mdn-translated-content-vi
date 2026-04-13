---
title: "CSSRule: type property"
short-title: type
slug: Web/API/CSSRule/type
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSRule.type
---

{{APIRef("CSSOM")}}{{Deprecated_header}}

Thuộc tính chỉ đọc **`type`** của interface {{domxref("CSSRule")}} là một thuộc tính lỗi thời, trả về một số nguyên cho biết {{domxref("CSSRule")}} đại diện cho kiểu quy tắc nào.

Nếu bạn cần phân biệt các kiểu quy tắc CSS khác nhau, một lựa chọn thay thế phù hợp là dùng [`constructor.name`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name):

```js
const sheets = Array.from(document.styleSheets);
const rules = sheets.map((sheet) => Array.from(sheet.cssRules)).flat();

for (const rule of rules) {
  console.log(rule.constructor.name);
}
```

## Giá trị

- `CSSRule.STYLE_RULE` (`1`)
  - : Quy tắc là {{domxref("CSSStyleRule")}}, kiểu quy tắc phổ biến nhất: `selector { prop1: val1; prop2: val2; }`.
- `CSSRule.IMPORT_RULE` (`3`)
  - : Quy tắc là {{domxref("CSSImportRule")}} và đại diện cho quy tắc {{cssxref("@import")}}.
- `CSSRule.MEDIA_RULE` (`4`)
  - : Quy tắc là {{domxref("CSSMediaRule")}}.
- `CSSRule.FONT_FACE_RULE` (`5`)
  - : Quy tắc là {{domxref("CSSFontFaceRule")}}.
- `CSSRule.PAGE_RULE` (`6`)
  - : Quy tắc là {{domxref("CSSPageRule")}}.
- `CSSRule.KEYFRAMES_RULE` (`7`)
  - : Quy tắc là {{domxref("CSSKeyframesRule")}}.
- `CSSRule.KEYFRAME_RULE` (`8`)
  - : Quy tắc là {{domxref("CSSKeyframeRule")}}.
- `CSSRule.MARGIN_RULE` (`9`)
  - : Quy tắc là {{domxref("CSSMarginRule")}}.
- `CSSRule.NAMESPACE_RULE` (`10`)
  - : Quy tắc là {{domxref("CSSNamespaceRule")}}.
- `CSSRule.COUNTER_STYLE_RULE` (`11`)
  - : Quy tắc là {{domxref("CSSCounterStyleRule")}}.
- `CSSRule.SUPPORTS_RULE` (`12`)
  - : Quy tắc là {{domxref("CSSSupportsRule")}}.
- `CSSRule.FONT_FEATURE_VALUES_RULE` (`14`)
  - : Quy tắc là {{domxref("CSSFontFeatureValuesRule")}}.

Các giá trị `CSSRule.UNKNOWN_RULE` (`0`), `CSSRule.CHARSET_RULE` (`2`), `CSSRule.DOCUMENT_RULE` (`13`), `CSSRule.VIEWPORT_RULE` (`14`), và `CSSRule.REGION_STYLE_RULE` (`16`) không còn lấy được nữa.

## Ví dụ

```js
const rules = document.styleSheets[0].cssRules;
console.log(rules[0].type);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
