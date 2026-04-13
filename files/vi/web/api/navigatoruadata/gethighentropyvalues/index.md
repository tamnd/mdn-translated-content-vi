---
title: "NavigatorUAData: phương thức getHighEntropyValues()"
short-title: getHighEntropyValues()
slug: Web/API/NavigatorUAData/getHighEntropyValues
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NavigatorUAData.getHighEntropyValues
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`getHighEntropyValues()`** của giao diện {{domxref("NavigatorUAData")}} trả về một {{jsxref("Promise")}} giải quyết với đối tượng từ điển chứa thông tin low entropy và thông tin high entropy được yêu cầu về trình duyệt.

Đối tượng được giải quyết có các [thuộc tính "low entropy"](/en-US/docs/Web/API/NavigatorUAData#instance_properties) có sẵn trên đối tượng `NavigatorUAData` được bao gồm theo mặc định, đây là các giá trị khó có khả năng cho phép lấy dấu vân tay người dùng.
Nó cũng chứa tập hợp con các giá trị "high entropy" được yêu cầu trong đối tượng tham số và đã được cấp quyền.
Đây là các giá trị có nhiều khả năng cho phép lấy dấu vân tay hơn.
Lưu ý rằng ý nghĩa của các thuật ngữ [low entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints) và [high entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#high_entropy_hints) giống như được định nghĩa trong cơ chế HTTP [User Agent Client Hints](/en-US/docs/Web/HTTP/Guides/Client_hints).

> [!NOTE]
> Việc sử dụng phương thức `getHighEntropyValues()` để lấy dữ liệu user-agent high-entropy có thể được kiểm soát qua {{HTTPHeader('Permissions-Policy/ch-ua-high-entropy-values', 'ch-ua-high-entropy-values')}} {{HTTPHeader('Permissions-Policy')}}.
> Nếu quyền không được cho phép, phương thức chỉ trả về dữ liệu low-entropy `brands`, `mobile` và `platform`.

## Cú pháp

```js-nolint
getHighEntropyValues(hints)
```

### Tham số

- `hints`
  - : Một mảng chứa các gợi ý high-entropy cần trả về.
    Có thể bao gồm một hoặc nhiều trong số:
    - `"architecture"`
    - `"bitness"`
    - `"formFactors"`
    - `"fullVersionList"`
    - `"model"`
    - `"platformVersion"`
    - `"uaFullVersion"` {{Deprecated_Inline}}
    - `"wow64"`

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với đối tượng chứa một số hoặc tất cả các giá trị sau (dựa trên các gợi ý được yêu cầu và được cấp):

- `brands`
  - : Trả về mảng các đối tượng chứa `brand` và `version` chỉ định tên thương hiệu và phiên bản của trình duyệt (thông tin tương tự như được cung cấp bởi {{domxref("NavigatorUAData.brands")}}).
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)).
- `mobile`
  - : Trả về `true` nếu user agent đang chạy trên thiết bị di động (thông tin tương tự như được cung cấp bởi {{domxref("NavigatorUAData.mobile")}}).
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Mobile")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)).
- `platform`
  - : Trả về chuỗi mô tả nền tảng mà user agent đang chạy trên, như `"Windows"` (thông tin tương tự như được cung cấp bởi {{domxref("NavigatorUAData.platform")}}).
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Platform")}} (một [low-entropy client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints)).
- `architecture`
  - : Một chuỗi chứa kiến trúc nền tảng. Ví dụ, `"x86"`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Arch")}} sau khi máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `bitness`
  - : Một chuỗi chứa số bit kiến trúc. Ví dụ, `"32"` hoặc `"64"`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Bitness")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `formFactors`
  - : Một mảng chuỗi chứa các form factor của thiết bị. Ví dụ, `["Tablet", "XR"]`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Form-Factors")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `fullVersionList`
  - : Một mảng các đối tượng với thuộc tính `"brand"` và `"version"` đại diện cho tên trình duyệt và phiên bản đầy đủ.
    Ví dụ, `{"brand": "Google Chrome", "version": "103.0.5060.134"}, {"brand": "Chromium", "version": "103.0.5060.134"}`.
    Lưu ý rằng một đối tượng có thể cố ý chứa thông tin không hợp lệ để ngăn các trang web dựa vào danh sách trình duyệt cố định.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Full-Version-List")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `model`
  - : Một chuỗi chứa model của thiết bị di động. Ví dụ, `"Pixel 2XL"`. Nếu thiết bị không phải thiết bị di động hoặc model thiết bị không được biết, `model` sẽ là `""`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Model")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `platformVersion`
  - : Một chuỗi chứa phiên bản nền tảng. Tên nền tảng luôn có sẵn dưới dạng gợi ý low-entropy `platform`. Ví dụ, `"10.0"`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Platform-Version")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `uaFullVersion` {{Deprecated_Inline}}
  - : Một chuỗi chứa phiên bản trình duyệt đầy đủ. Ví dụ, `"103.0.5060.134"`. Đã lỗi thời, thay bằng `fullVersionList`.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-Full-Version")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.
- `wow64`
  - : Giá trị boolean cho biết liệu binary của user agent có đang chạy ở chế độ 32-bit trên Windows 64-bit không.
    Lưu ý rằng thông tin này có thể được gửi đến máy chủ trong header {{HTTPHeader("Sec-CH-UA-WoW64")}} nếu máy chủ yêu cầu rõ ràng trong header {{HTTPHeader("Accept-CH")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu user-agent quyết định rằng một hoặc nhiều `hints` được yêu cầu không nên được trả về.

## Ví dụ

Trong ví dụ dưới đây, một số gợi ý được yêu cầu bằng phương thức `getHighEntropyValues()`.
Khi promise giải quyết, thông tin này được in ra console.

```js
navigator.userAgentData
  .getHighEntropyValues([
    "architecture",
    "model",
    "platformVersion",
    "fullVersionList",
  ])
  .then((values) => console.log(values));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các giá trị này cũng có sẵn qua HTTP request headers:
  - [Low-entropy client hints](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints) được gửi tự động:
    - {{HTTPHeader("Sec-CH-UA")}}
    - {{HTTPHeader("Sec-CH-UA-Mobile")}}
    - {{HTTPHeader("Sec-CH-UA-Platform")}}
  - Máy chủ có thể yêu cầu nhận high-entropy client hints trong các yêu cầu tiếp theo, bằng cách dùng header {{HTTPHeader("Accept-CH")}}:
    - {{HTTPHeader("Sec-CH-UA-Arch")}}
    - {{HTTPHeader("Sec-CH-UA-Bitness")}}
    - {{HTTPHeader("Sec-CH-UA-Full-Version")}}
    - {{HTTPHeader("Sec-CH-UA-Model")}}
    - {{HTTPHeader("Sec-CH-UA-Platform-Version")}}
