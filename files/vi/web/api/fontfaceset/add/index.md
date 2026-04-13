---
title: "FontFaceSet: phương thức add()"
short-title: add()
slug: Web/API/FontFaceSet/add
page-type: web-api-instance-method
browser-compat: api.FontFaceSet.add
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức **`add()`** của giao diện {{domxref("FontFaceSet")}} thêm font mới vào tập hợp.

## Cú pháp

```js-nolint
add(font)
```

### Tham số

- `font`
  - : {{domxref("FontFace")}} cần thêm vào tập hợp.

### Giá trị trả về

{{domxref("FontFaceSet")}} mới.

### Ngoại lệ

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Xảy ra nếu font này đã được đưa vào qua quy tắc CSS {{cssxref("@font-face")}}.

## Ví dụ

Trong ví dụ sau, một đối tượng {{domxref("FontFace")}} mới được tạo rồi thêm vào {{domxref("FontFaceSet")}}.

```js
const font = new FontFace("MyFont", 'url("myFont.woff2")');
document.fonts.add(font);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
