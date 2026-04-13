---
title: "CSSKeywordValue: thuộc tính value"
short-title: value
slug: Web/API/CSSKeywordValue/value
page-type: web-api-instance-property
browser-compat: api.CSSKeywordValue.value
---

{{APIRef("CSS Typed Object Model API")}}

Thuộc tính **`value`** của giao diện {{domxref("CSSKeywordValue")}} trả về hoặc thiết lập giá trị của `CSSKeywordValue`.

## Giá trị

Một chuỗi.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu thuộc tính `value` là {{jsxref('String')}} rỗng khi được thiết lập.

## Ví dụ

Ví dụ sau đặt lại thuộc tính CSS {{cssxref('display')}} về giá trị mặc định của nó.

```js
let indicator = document.getElementById("indicator");
indicator.attributeStyleMap.set("display", new CSSKeywordValue("initial"));
indicator.attributeStyleMap.get("display").value; // 'initial'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
