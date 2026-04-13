---
title: "TrustedTypePolicyFactory: emptyHTML property"
short-title: emptyHTML
slug: Web/API/TrustedTypePolicyFactory/emptyHTML
page-type: web-api-instance-property
browser-compat: api.TrustedTypePolicyFactory.emptyHTML
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`emptyHTML`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về một đối tượng {{domxref("TrustedHTML")}} chứa chuỗi rỗng.

Đối tượng này có thể được sử dụng khi ứng dụng yêu cầu chèn chuỗi rỗng vào một sink tiêm.

## Giá trị

Một đối tượng {{domxref("TrustedHTML")}}.

## Ví dụ

Trong ví dụ bên dưới, một chuỗi rỗng sẽ được chèn vào phần tử. Do đó không cần tạo chính sách, và thuộc tính `emptyHTML` có thể được sử dụng để chèn phần tử rỗng khi đối tượng Trusted Types được mong đợi.

```js
el.innerHTML = trustedTypes.emptyHTML;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
