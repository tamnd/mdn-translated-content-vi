---
title: "TrustedTypePolicyFactory: getAttributeType() method"
short-title: getAttributeType()
slug: Web/API/TrustedTypePolicyFactory/getAttributeType
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.getAttributeType
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`getAttributeType()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} cho phép các nhà phát triển web kiểm tra xem có yêu cầu Trusted Type cho một phần tử và thuộc tính không, và nếu có thì là loại nào.

## Cú pháp

```js-nolint
getAttributeType(tagName, attribute)
getAttributeType(tagName, attribute, elementNS)
getAttributeType(tagName, attribute, elementNS, attrNS)
```

### Tham số

- `tagName`
  - : Một chuỗi chứa tên của thẻ HTML.
- `attribute`
  - : Một chuỗi chứa một thuộc tính.
- `elementNS` {{optional_inline}}
  - : Một chuỗi chứa không gian tên, nếu rỗng thì mặc định là không gian tên HTML.
- `attrNS` {{optional_inline}}
  - : Một chuỗi chứa không gian tên, nếu rỗng thì mặc định là null.

### Giá trị trả về

Một chuỗi với một trong các giá trị:

- `"TrustedHTML"`
- `"TrustedScript"`
- `"TrustedScriptURL"`

Hoặc, null.

## Ví dụ

Trong ví dụ này, truyền phần tử {{htmlelement("script")}} và thuộc tính `src` vào `getAttributeType()` trả về "TrustedScriptURL".

```js
console.log(trustedTypes.getAttributeType("script", "src")); // "TrustedScriptURL"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
