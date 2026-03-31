---
title: Firefox user agent string reference
short-title: Firefox UA string
slug: Web/HTTP/Reference/Headers/User-Agent/Firefox
page-type: guide
sidebar: http
---

Tài liệu này mô tả chuỗi tác nhân người dùng được sử dụng trong Firefox 4 và các ứng dụng sau dựa trên Gecko 2.0 và sau đó. Để phân tích các thay đổi trong chuỗi trong Gecko 2.0, xem [Final User Agent string for Firefox 4](https://hacks.mozilla.org/2010/09/final-user-agent-string-for-firefox-4/) (bài đăng blog). Xem thêm tài liệu này về [user agent sniffing](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent) và [bài đăng blog Hacks](https://hacks.mozilla.org/2013/09/user-agent-detection-history-and-checklist/).

## Dạng chung

Chuỗi UA của bản thân Firefox được chia thành bốn thành phần:

`Mozilla/5.0 (platform; rv:gecko-version) Gecko/gecko-trail Firefox/firefox-version`

- `Mozilla/5.0` là token chung cho biết trình duyệt tương thích Mozilla, và phổ biến với hầu hết mọi trình duyệt ngày nay.
- `platform` mô tả nền tảng gốc mà trình duyệt đang chạy (ví dụ Windows, Mac, Linux hoặc Android), và liệu có phải điện thoại di động hay không. Điện thoại Firefox OS nói `Mobile`; web là nền tảng. Lưu ý rằng `platform` có thể gồm nhiều token phân cách bằng `;`. Xem bên dưới để biết thêm chi tiết và ví dụ.

- `rv:gecko-version` cho biết phiên bản phát hành của Gecko (chẳng hạn như `17.0`).
- `Gecko/gecko-trail` cho biết rằng trình duyệt dựa trên Gecko.
- Trên máy tính, `gecko-trail` là chuỗi cố định `20100101`.
- `Firefox/firefox-version` cho biết trình duyệt là Firefox, và cung cấp phiên bản (chẳng hạn như `17.0`).
- Từ Firefox 10 trên di động, `gecko-trail` giống như `firefox-version`.

> [!NOTE]
> Cách được khuyến nghị để nhận diện các trình duyệt dựa trên Gecko (nếu bạn _phải_ nhận diện engine trình duyệt thay vì sử dụng phát hiện tính năng) là bằng sự hiện diện của chuỗi `Gecko` và `rv:`, vì một số trình duyệt khác bao gồm token `like Gecko`.

Đối với các sản phẩm khác dựa trên Gecko, chuỗi có thể có một trong hai dạng, trong đó các token có cùng ý nghĩa ngoại trừ những gì được ghi chú bên dưới:

`Mozilla/5.0 (platform; rv:gecko-version) Gecko/gecko-trail app-name/app-version`
`Mozilla/5.0 (platform; rv:gecko-version) Gecko/gecko-trail Firefox/firefox-version app-name/app-version`

- `app-name/app-version` cho biết tên ứng dụng và phiên bản. Ví dụ, đây có thể là `Camino/2.1.1`, hoặc `SeaMonkey/2.7.1`.
- `Firefox/firefox-version` là token tương thích tùy chọn mà một số trình duyệt dựa trên Gecko có thể chọn để đưa vào, để đạt được khả năng tương thích tối đa với các trang web mong đợi Firefox. `firefox-version` thường đại diện cho bản phát hành Firefox tương đương với phiên bản Gecko đã cho. Một số trình duyệt dựa trên Gecko có thể không sử dụng token này; vì lý do này, người nhận diện nên tìm Gecko — không phải Firefox!

## Chỉ thị Mobile và Tablet

Phần `platform` của chuỗi UA cho biết liệu Firefox có đang chạy trên thiết bị kích thước điện thoại hay tablet hay không. Khi Firefox chạy trên thiết bị có form factor điện thoại, có token `Mobile;` trong phần `platform` của chuỗi UA. Khi Firefox chạy trên thiết bị tablet, có token `Tablet;` trong phần `platform` của chuỗi UA thay thế. Ví dụ:

```plain
Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0
Mozilla/5.0 (Android 4.4; Tablet; rv:41.0) Gecko/41.0 Firefox/41.0
```

> [!NOTE]
> Số phiên bản không liên quan. Tránh suy luận tài liệu dựa trên những điều này.

Cách ưu tiên để nhắm mục tiêu nội dung vào form factor thiết bị là sử dụng CSS Media Queries. Tuy nhiên, nếu bạn sử dụng UA sniffing để nhắm mục tiêu nội dung vào form factor thiết bị, hãy tìm **Mobi** (để bao gồm Opera Mobile, sử dụng "Mobi") cho form factor điện thoại và **không** giả định bất kỳ tương quan nào giữa "Android" và form factor thiết bị. Theo cách này, mã của bạn sẽ hoạt động nếu/khi Firefox được chuyển đến các hệ điều hành điện thoại/tablet khác hoặc Android được sử dụng cho laptop. Ngoài ra, hãy sử dụng phát hiện cảm ứng để tìm thiết bị cảm ứng thay vì tìm "Mobi" hoặc "Tablet", vì có thể có thiết bị cảm ứng không phải tablet.

> [!NOTE]
> Các thiết bị Firefox OS tự xác định mà không có chỉ thị hệ điều hành; ví dụ: "Mozilla/5.0 (Mobile; rv:15.0) Gecko/15.0 Firefox/15.0". Web là nền tảng.

## Windows

Các tác nhân người dùng Windows có các biến thể sau, trong đó _x.y_ là phiên bản Windows NT (ví dụ, Windows NT 6.1).

| Phiên bản Windows       | Chuỗi tác nhân người dùng Gecko                                                   |
| ----------------------- | --------------------------------------------------------------------------------- |
| Windows NT trên CPU x86 | Mozilla/5.0 (Windows NT _x_._y_; rv:10.0) Gecko/20100101 Firefox/10.0             |
| Windows NT trên CPU x64 | Mozilla/5.0 (Windows NT _x_._y_; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0 |

> [!NOTE]
> CPU aarch64 được báo cáo là x86_64 trên Windows 11, và x86 trên Windows 10 (vì nó không hỗ trợ mô phỏng x64).
> Xem [Bugzilla #1763310](https://bugzil.la/1763310).

## macOS

Ở đây, _x.y_ là phiên bản của macOS (ví dụ, macOS 10.15). Bắt đầu từ Firefox 87, Firefox giới hạn số phiên bản macOS được báo cáo là 10.15, vì vậy macOS 11.0 Big Sur và sau đó sẽ được báo cáo là "10.15" trong chuỗi User-Agent. Các Mac dựa trên ARM sẽ được báo cáo là "Intel" trong chuỗi User-Agent.

| Phiên bản Mac OS X                      | Chuỗi tác nhân người dùng Gecko                                                    |
| --------------------------------------- | ---------------------------------------------------------------------------------- |
| Mac OS X trên x86, x86_64, hoặc aarch64 | Mozilla/5.0 (Macintosh; Intel Mac OS X _x.y_; rv:10.0) Gecko/20100101 Firefox/10.0 |
| Mac OS X trên PowerPC                   | Mozilla/5.0 (Macintosh; PPC Mac OS X _x.y_; rv:10.0) Gecko/20100101 Firefox/10.0   |

## Linux

Linux là nền tảng đa dạng hơn. Bản phân phối Linux của bạn có thể bao gồm phần mở rộng thay đổi user-agent của bạn. Một vài ví dụ phổ biến được đưa ra bên dưới.

| Phiên bản Linux               | Chuỗi tác nhân người dùng Gecko                                      |
| ----------------------------- | -------------------------------------------------------------------- |
| Linux desktop trên CPU i686   | Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0   |
| Linux desktop trên CPU x86_64 | Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0 |

> [!NOTE]
> Trong Firefox 127.0 và sau đó, x86 32-bit bây giờ sẽ được báo cáo là x86_64 trong chuỗi User-Agent của Firefox, {{domxref("navigator.platform")}}, và {{domxref("navigator.oscpu")}} (xem [Firefox 127.0 Release Notes](https://www.firefox.com/en-US/firefox/127.0/releasenotes/)).

## Firefox cho Android

Firefox cho Android chứa phiên bản Android như một phần của token _platform_. Để tăng khả năng tương thích, nếu trình duyệt đang chạy trên phiên bản thấp hơn 4, nó sẽ báo cáo 4.4. Các phiên bản Android 4 trở lên báo cáo chính xác phiên bản. Lưu ý rằng Gecko giống nhau — với cùng khả năng — được chuyển đến tất cả các phiên bản Android.

| Form factor | Chuỗi tác nhân người dùng Gecko                                    |
| ----------- | ------------------------------------------------------------------ |
| Điện thoại  | Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0 |
| Tablet      | Mozilla/5.0 (Android 4.4; Tablet; rv:41.0) Gecko/41.0 Firefox/41.0 |

## Focus cho Android

Từ phiên bản 1, Focus được hỗ trợ bởi Android WebView và sử dụng định dạng chuỗi tác nhân người dùng sau:

```plain
Mozilla/5.0 (Linux; <Android Version> <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Version/4.0 Focus/<focus version> Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>
```

Các phiên bản tablet trên WebView phản chiếu di động, nhưng không chứa token `Mobile`.

Bắt đầu từ Phiên bản 6, người dùng có thể chọn sử dụng Focus dựa trên GeckoView cho Android với tùy chọn ẩn: nó sử dụng chuỗi UA GeckoView để quảng cáo khả năng tương thích Gecko.

| Phiên bản Focus (Rendering Engine) | Chuỗi User Agent                                                                                                                       |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| 1.0 (WebView Mobile)               | Mozilla/5.0 (Linux; Android 7.0) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/1.0 Chrome/59.0.3029.83 Mobile Safari/537.36 |
| 1.0 (WebView Tablet)               | Mozilla/5.0 (Linux; Android 7.0) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/1.0 Chrome/59.0.3029.83 Safari/537.36        |
| 6.0 (GeckoView)                    | Mozilla/5.0 (Android 7.0; Mobile; rv:62.0) Gecko/62.0 Firefox/62.0                                                                     |

Tác nhân người dùng Klar giống như [Focus](#focus_for_ios).

## Firefox cho iOS

Firefox cho iOS sử dụng chuỗi UA Mobile Safari mặc định, với token bổ sung **FxiOS/\<version>** trên iPod và iPhone, tương tự như [cách Chrome cho iOS tự xác định](https://chromium.googlesource.com/chromium/src/+/HEAD/docs/ios/user_agent.md).

| Form factor | Chuỗi tác nhân người dùng Firefox cho iOS                                                                                                   |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| iPod        | Mozilla/5.0 (iPod touch; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) **FxiOS/1.0** Mobile/12F69 Safari/600.1.4 |
| iPhone      | Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) **FxiOS/1.0** Mobile/12F69 Safari/600.1.4     |
| iPad        | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15                       |

Trên iPad, chuỗi tác nhân người dùng xuất hiện giống hệt như Safari. Để biết các vấn đề liên quan đến việc không bao gồm `FxiOS` trên iOS, xem [mozilla-mobile/firefox-ios#6620](https://github.com/mozilla-mobile/firefox-ios/issues/6620).

## Focus cho iOS

Phiên bản 7 của Focus cho iOS sử dụng chuỗi tác nhân người dùng với định dạng sau:

```plain
Mozilla/5.0 (iPhone; CPU iPhone OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/7.0.4 Mobile/16B91 Safari/605.1.15
```

Lưu ý: tác nhân người dùng này được lấy từ simulator iPhone XR và có thể khác trên thiết bị thực tế.

## Firefox cho Fire TV

Phiên bản 3 (và có thể trước đó) của Firefox cho Fire TV sử dụng chuỗi tác nhân người dùng với định dạng sau:

```plain
Mozilla/5.0 (Linux; <Android version>) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/<firefox-version> Chrome/<Chrome Rev> Safari/<WebKit Rev>
```

| Phiên bản Firefox TV | Chuỗi User Agent                                                                                                                   |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| v3.0                 | Mozilla/5.0 (Linux; Android 7.1.2) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/3.0 Chrome/59.0.3017.125 Safari/537.36 |

## Firefox cho Echo Show

Từ phiên bản 1.1, Firefox cho Echo Show sử dụng chuỗi tác nhân người dùng với định dạng sau:

```plain
Mozilla/5.0 (Linux; <Android version>) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/<firefox-version> Chrome/<Chrome Rev> Safari/<WebKit Rev>
```

| Phiên bản Firefox cho Echo Show | Chuỗi tác nhân người dùng                                                                                                          |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| v1.1                            | Mozilla/5.0 (Linux; Android 5.1.1) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/1.1 Chrome/59.0.3017.125 Safari/537.36 |

## Firefox OS

| Form factor         | Chuỗi tác nhân người dùng Gecko                                   |
| ------------------- | ----------------------------------------------------------------- |
| Điện thoại          | Mozilla/5.0 (Mobile; rv:26.0) Gecko/26.0 Firefox/26.0             |
| Tablet              | Mozilla/5.0 (Tablet; rv:26.0) Gecko/26.0 Firefox/26.0             |
| TV                  | Mozilla/5.0 (TV; rv:44.0) Gecko/44.0 Firefox/44.0                 |
| Dành riêng thiết bị | Mozilla/5.0 (Mobile; **_nnnn;_** rv:26.0) Gecko/26.0 Firefox/26.0 |

### Chuỗi tác nhân người dùng dành riêng thiết bị

Mặc dù Mozilla **khuyến nghị mạnh mẽ** không nên làm vậy, một số nhà sản xuất điện thoại đáng tiếc bao gồm token trong chuỗi UA của thiết bị đại diện cho ID thiết bị của họ. Nếu đây là trường hợp, chuỗi UA Firefox OS sẽ trông giống chuỗi dành riêng thiết bị trong bảng trên, trong đó **_nnnn;_** là mã của nhà sản xuất cho thiết bị (xem [Hướng dẫn](https://wiki.mozilla.org/B2G/User_Agent/Device_Model_Inclusion_Requirements)). Một số trong số đó chúng tôi đã nhận thấy có dạng "**NexusOne;**", "**ZTEOpen;**", hoặc "**Open C;**" (lưu ý rằng việc đặt khoảng trắng cũng không được khuyến khích). Chúng tôi cung cấp thông tin này để hỗ trợ logic phát hiện UA của bạn, nhưng Mozilla không khuyến khích phát hiện ID thiết bị trong chuỗi UA.

Đây là biểu thức chính quy JavaScript sẽ phát hiện tất cả thiết bị di động, bao gồm cả thiết bị có ID thiết bị trong chuỗi UA của chúng:

```js
/mobi/i;
```

`i` làm cho nó không phân biệt chữ hoa chữ thường, và `mobi` khớp với tất cả trình duyệt di động.

### Số phiên bản Firefox OS

Mặc dù số phiên bản của Firefox OS không được bao gồm trong chuỗi UA, nhưng có thể suy ra thông tin phiên bản từ số phiên bản Gecko có trong chuỗi UA.

| Số phiên bản Firefox OS | Số phiên bản Gecko |
| ----------------------- | ------------------ |
| 1.0.1                   | 18.0               |
| 1.1                     | 18.1               |
| 1.2                     | 26.0               |
| 1.3                     | 28.0               |
| 1.4                     | 30.0               |
| 2.0                     | 32.0               |
| 2.1                     | 34.0               |
| 2.2                     | 37                 |
| 2.5                     | 44                 |

> [!NOTE]
> Dễ dàng tìm thấy sự tương ứng bằng cách xem [tên kho lưu trữ Mercurial](https://hg-edge.mozilla.org/releases): các kho lưu trữ bắt đầu bằng `mozilla-b2g` là các kho lưu trữ phát hành cho Firefox OS, và có cả phiên bản Firefox OS và Gecko trong tên của chúng.

Firefox OS có số phiên bản bốn chữ số: `X.X.X.Y`. Hai chữ số đầu thuộc về nhóm sản phẩm Mozilla và biểu thị các phiên bản có tính năng mới (ví dụ: v1.1, 1.2, v.v.). Chữ số thứ ba được tăng lên với các tag phiên bản thường xuyên (khoảng 6 tuần một lần) cho các bản cập nhật bảo mật, và chữ số thứ tư thuộc về OEM.

## Xem thêm

- Khuyến nghị về [nhận diện chuỗi UA để hỗ trợ đa trình duyệt](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent)
- [`navigator.userAgent`](/en-US/docs/Web/API/Window/navigator)
