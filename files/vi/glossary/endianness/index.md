---
title: Endianness
slug: Glossary/Endianness
page-type: glossary-definition
sidebar: glossarysidebar
---

**Endian** và **endianness** (hay "byte-order" - thứ tự byte) mô tả cách máy tính tổ chức các byte tạo nên số.

Mỗi vị trí lưu trữ bộ nhớ có một chỉ mục hoặc địa chỉ. Mỗi byte có thể lưu trữ một số 8-bit (tức là từ `0x00` đến `0xff`), vì vậy bạn phải dự phòng nhiều hơn một byte để lưu trữ một số lớn hơn. Cách _sắp xếp_ nhiều byte trong một số phổ biến nhất là **little-endian**, được sử dụng trên tất cả các bộ xử lý Intel. Little-endian có nghĩa là lưu trữ các byte theo thứ tự từ ít quan trọng nhất đến quan trọng nhất (byte ít quan trọng nhất chiếm địa chỉ đầu tiên hoặc thấp nhất), có thể so sánh với cách viết ngày tháng thông thường ở châu Âu (ví dụ: 31 December 2050).

Tự nhiên, **big-endian** là thứ tự ngược lại, có thể so sánh với định dạng ngày ISO (2050-12-31). Big-endian cũng thường được gọi là "network byte order" vì các tiêu chuẩn Internet thường yêu cầu dữ liệu được lưu trữ big-endian.

Ví dụ với số `0x12345678` (tức là 305 419 896 trong hệ thập phân):

- _little-endian_: `0x78 0x56 0x34 0x12`
- _big-endian_: `0x12 0x34 0x56 0x78`
- _mixed-endian_ (lịch sử và rất hiếm): `0x34 0x12 0x78 0x56`

## Xem thêm

- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
- [Typed Arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- [Endianness](https://en.wikipedia.org/wiki/Endianness) (Wikipedia)
- Các thuật ngữ liên quan:
  - {{Glossary("Data structure")}}
