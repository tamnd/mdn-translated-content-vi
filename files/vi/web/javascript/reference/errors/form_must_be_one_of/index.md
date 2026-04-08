---
title: "RangeError: form must be one of 'NFC', 'NFD', 'NFKC', or 'NFKD'"
slug: Web/JavaScript/Reference/Errors/Form_must_be_one_of
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "form must be one of 'NFC', 'NFD', 'NFKC', or 'NFKD'" xảy ra khi một chuỗi không hợp lệ được truyền vào phương thức {{jsxref("String.prototype.normalize()")}}.

## Thông báo

```plain
RangeError: The normalization form should be one of NFC, NFD, NFKC, NFKD. (V8-based)
RangeError: form must be one of 'NFC', 'NFD', 'NFKC', or 'NFKD' (Firefox)
RangeError: argument does not match any normalization form (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Nguyên nhân?

Phương thức {{jsxref("String.prototype.normalize()")}} chỉ chấp nhận bốn giá trị sau làm đối số `form`: `"NFC"`, `"NFD"`, `"NFKC"`, hoặc `"NFKD"`. Nếu bạn truyền vào bất kỳ giá trị nào khác, một lỗi sẽ được ném ra. Hãy đọc tài liệu tham khảo của `normalize()` để tìm hiểu về các dạng chuẩn hóa khác nhau.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
"foo".normalize("nfc"); // RangeError
"foo".normalize(" NFC "); // RangeError
```

### Trường hợp hợp lệ

```js example-good
"foo".normalize("NFC"); // 'foo'
```

## Xem thêm

- {{jsxref("String.prototype.normalize()")}}
