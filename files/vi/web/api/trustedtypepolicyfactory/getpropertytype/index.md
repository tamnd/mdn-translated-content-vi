---
title: "TrustedTypePolicyFactory: getPropertyType() method"
short-title: getPropertyType()
slug: Web/API/TrustedTypePolicyFactory/getPropertyType
page-type: web-api-instance-method
browser-compat: api.TrustedTypePolicyFactory.getPropertyType
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`getPropertyType()`** của giao diện {{domxref("TrustedTypePolicyFactory")}} cho phép các nhà phát triển web kiểm tra xem có yêu cầu Trusted Type cho một thuộc tính của phần tử không.

## Cú pháp

```js-nolint
getPropertyType(tagName, property)
getPropertyType(tagName, property, elementNS)
```

### Tham số

- `tagName`
  - : Một chuỗi chứa tên của thẻ HTML.
- `property`
  - : Một chuỗi chứa thuộc tính, ví dụ `"innerHTML"`.
- `elementNS` {{optional_inline}}
  - : Một chuỗi chứa không gian tên, nếu rỗng thì mặc định là không gian tên HTML.

### Giá trị trả về

Một chuỗi với một trong các giá trị:

- `"TrustedHTML"`
- `"TrustedScript"`
- `"TrustedScriptURL"`

Hoặc, `null`.

## Ví dụ

Trong ví dụ này, truyền phần tử {{htmlelement("div")}} và thuộc tính `innerHTML` vào `getPropertyType()` trả về "TrustedHTML".

```js
console.log(trustedTypes.getPropertyType("div", "innerHTML")); // "TrustedHTML"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
