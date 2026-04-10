---
title: "TextDecoder: encoding property"
short-title: encoding
slug: Web/API/TextDecoder/encoding
page-type: web-api-instance-property
browser-compat: api.TextDecoder.encoding
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`TextDecoder.encoding`** trả về một chuỗi chứa tên của mã hóa ký tự mà bộ giải mã này sẽ sử dụng.

Mã hóa được đặt bởi tham số [`label`](/en-US/docs/Web/API/TextDecoder/TextDecoder#label) truyền vào hàm tạo và mặc định là `utf-8`.

## Giá trị

Một chuỗi ASCII viết thường, có thể là một trong các giá trị sau:

- Mã hóa được khuyến nghị cho Web: `'utf-8'`.
- Các mã hóa một byte kế thừa:
  ['ibm866'](https://en.wikipedia.org/wiki/Code_page_866),
  ['iso-8859-2'](https://en.wikipedia.org/wiki/ISO/IEC_8859-2),
  ['iso-8859-3'](https://en.wikipedia.org/wiki/ISO/IEC_8859-3),
  ['iso-8859-4'](https://en.wikipedia.org/wiki/ISO/IEC_8859-4),
  ['iso-8859-5'](https://en.wikipedia.org/wiki/ISO/IEC_8859-5),
  ['iso-8859-6'](https://en.wikipedia.org/wiki/ISO/IEC_8859-6),
  ['iso-8859-7'](https://en.wikipedia.org/wiki/ISO/IEC_8859-7),
  ['iso-8859-8'](https://en.wikipedia.org/wiki/ISO/IEC_8859-8),
  ['iso-8859-8i'](https://en.wikipedia.org/wiki/ISO-8859-8-I),
  ['iso-8859-10'](https://en.wikipedia.org/wiki/ISO/IEC_8859-10),
  ['iso-8859-13'](https://en.wikipedia.org/wiki/ISO/IEC_8859-13),
  ['iso-8859-14'](https://en.wikipedia.org/wiki/ISO/IEC_8859-14),
  ['iso-8859-15'](https://en.wikipedia.org/wiki/ISO/IEC_8859-15),
  ['iso-8859-16'](https://en.wikipedia.org/wiki/ISO/IEC_8859-16),
  ['koi8-r'](https://en.wikipedia.org/wiki/KOI8-R),
  ['koi8-u'](https://en.wikipedia.org/wiki/KOI8-U),
  ['macintosh'](https://en.wikipedia.org/wiki/Mac_OS_Roman),
  ['windows-874'](https://en.wikipedia.org/wiki/Windows-874),
  ['windows-1250'](https://en.wikipedia.org/wiki/Windows-1250),
  ['windows-1251'](https://en.wikipedia.org/wiki/Windows-1251),
  ['windows-1252'](https://en.wikipedia.org/wiki/Windows-1252),
  ['windows-1253'](https://en.wikipedia.org/wiki/Windows-1253),
  ['windows-1254'](https://en.wikipedia.org/wiki/Windows-1254),
  ['windows-1255'](https://en.wikipedia.org/wiki/Windows-1255),
  ['windows-1256'](https://en.wikipedia.org/wiki/Windows-1256),
  ['windows-1257'](https://en.wikipedia.org/wiki/Windows-1257),
  ['windows-1258'](https://en.wikipedia.org/wiki/Windows-1258), hoặc
  ['x-mac-cyrillic'](https://en.wikipedia.org/wiki/Macintosh_Cyrillic_encoding).
- Các mã hóa nhiều byte tiếng Trung (giản thể) kế thừa:
  ['gbk'](https://en.wikipedia.org/wiki/GBK),
  ['gb18030'](https://en.wikipedia.org/wiki/GB_18030).
- Mã hóa nhiều byte tiếng Trung (phồn thể) kế thừa:
  ['big5'](https://en.wikipedia.org/wiki/Big5).
- Các mã hóa nhiều byte tiếng Nhật kế thừa:
  ['euc-jp'](https://en.wikipedia.org/wiki/Extended_Unix_Code#EUC-JP),
  ['iso-2022-jp'](https://en.wikipedia.org/wiki/ISO/IEC_2022#ISO-2022-JP),
  ['shift-jis'](https://en.wikipedia.org/wiki/Shift_JIS).
- Các mã hóa nhiều byte tiếng Hàn kế thừa:
  ['euc-kr'](https://en.wikipedia.org/wiki/Extended_Unix_Code#EUC-KR).
- Các mã hóa kế thừa linh tinh:
  ['utf-16be'](https://en.wikipedia.org/wiki/UTF-16#Byte_order_encoding_schemes),
  ['utf-16le'](https://en.wikipedia.org/wiki/UTF-16#Byte_order_encoding_schemes),
  `'x-user-defined'`.
- Một mã hóa đặc biệt, `'replacement'`.
  Mã hóa này giải mã đầu vào rỗng thành đầu ra rỗng và bất kỳ đầu vào độ dài tùy ý nào khác thành một ký tự thay thế duy nhất.
  Nó được dùng để ngăn các cuộc tấn công làm lệch mã hóa giữa client và server.
  Các mã hóa sau cũng ánh xạ về mã hóa replacement: `ISO-2022-CN`, `ISO-2022-CN-ext`, ['iso-2022-kr'](https://en.wikipedia.org/wiki/ISO/IEC_2022#ISO-2022-KR), và ['hz-gb-2312'](<https://en.wikipedia.org/wiki/HZ_(character_encoding)>).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextDecoder")}} mà nó thuộc về.
