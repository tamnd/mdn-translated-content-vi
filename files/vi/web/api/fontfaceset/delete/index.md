---
title: "FontFaceSet: phương thức delete()"
short-title: delete()
slug: Web/API/FontFaceSet/delete
page-type: web-api-instance-method
browser-compat: api.FontFaceSet.delete
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("FontFaceSet")}} xóa font khỏi tập hợp.

Các font face được thêm vào tập hợp qua quy tắc CSS {{cssxref("@font-face")}} vẫn kết nối với CSS tương ứng và không thể xóa được.

## Cú pháp

```js-nolint
delete(font)
```

### Tham số

- `font`
  - : {{domxref("FontFace")}} cần xóa khỏi tập hợp.

### Giá trị trả về

Giá trị boolean là `true` nếu xóa thành công, ngược lại là `false`.

## Ví dụ

Trong ví dụ sau, một đối tượng {{domxref("FontFace")}} mới được tạo rồi xóa khỏi {{domxref("FontFaceSet")}}.

```js
const font = new FontFace("MyFont", 'url("myFont.woff2")');
document.fonts.delete(font);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
