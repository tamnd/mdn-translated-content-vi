---
title: "Navigator: thuộc tính language"
short-title: language
slug: Web/API/Navigator/language
page-type: web-api-instance-property
browser-compat: api.Navigator.language
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`language`** của giao diện {{domxref("Navigator")}} trả về một chuỗi biểu thị ngôn ngữ ưa thích của người dùng, thường là ngôn ngữ của giao diện người dùng trình duyệt.

## Giá trị

Một chuỗi biểu thị phiên bản ngôn ngữ ở định dạng {{glossary("BCP 47 language tag")}}. Ví dụ về thẻ ngôn ngữ hợp lệ bao gồm `en`, `en-US`, `fr`, `fr-FR`, `es-ES`, v.v.

Lưu ý rằng trong Safari trên iOS trước 10.2, mã quốc gia được trả về là chữ thường: "en-us", "fr-fr", v.v.

## Ví dụ

### Sử dụng hàm tạo Intl để định dạng ngôn ngữ cụ thể

Hàm tạo {{jsxref("Intl")}} cho phép định dạng nội dung phù hợp với quy tắc của một ngôn ngữ nhất định. Bạn có thể chuyển `navigator.language` cho họ để định dạng nội dung bằng ngôn ngữ tương ứng với ngôn ngữ ưa thích của người dùng:

```js
const date = new Date("2012-05-24");

const formattedDate = new Intl.DateTimeFormat(navigator.language).format(date);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.languages")}}
- {{domxref("navigator")}}
- {{jsxref("Intl")}}
