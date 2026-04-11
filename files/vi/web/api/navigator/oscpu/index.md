---
title: "Navigator: thuộc tính oscpu"
short-title: oscpu
slug: Web/API/Navigator/oscpu
page-type: web-api-instance-property
browser-compat: api.Navigator.oscpu
---

{{ ApiRef("HTML DOM") }}

Thuộc tính **`Navigator.oscpu`** trả về một chuỗi xác định hệ điều hành hiện tại.

## Giá trị

Một chuỗi cung cấp một chuỗi xác định hệ điều hành mà trình duyệt đang chạy.

| Hệ điều hành                     | Định dạng chuỗi `oscpuInfo`                        |
| -------------------------------- | -------------------------------------------------- |
| Hệ điều hành/2                   | `OS/2 Warp x (either 3, 4 or 4.5)`                 |
| Windows CE                       | `WindowsCE x.y`                                    |
| Windows 64-bit (bản dựng 64-bit) | `Windows NT x.y; Win64; x64`                       |
| Windows 64-bit (bản dựng 32-bit) | `Windows NT x.y; WOW64`                            |
| Windows 32-bit                   | `Windows NT x.y`                                   |
| Mac OS X (bản dựng PPC)          | `PowerPC Mac OS X version x.y`                     |
| Mac OS X (bản dựng i386/x64)     | `Intel Mac OS X` hoặc `macOS version x.y`          |
| Linux 64-bit (bản dựng 32-bit)   | Đầu ra của `uname -s` theo sau là `i686 on x86_64` |
| Linux                            | Đầu ra `uname -sm`                                 |

Trong bảng này `x.y` đề cập đến phiên bản của hệ điều hành

## Ví dụ

```js
function osInfo() {
  alert(navigator.oscpu);
}

osInfo(); // alerts "Windows NT 6.0" for example
```

## Ghi chú sử dụng

Trừ khi mã của bạn có đặc quyền (chrome hoặc ít nhất có đặc quyền UniversalBrowserRead), mã này có thể nhận giá trị tùy chọn `general.oscpu.override` thay vì nền tảng thực sự.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
