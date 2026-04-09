---
title: Phân vùng trạng thái
slug: Web/Privacy/Guides/State_Partitioning
page-type: guide
sidebar: privacy
---

**Phân vùng trạng thái** là một nỗ lực rộng lớn của Mozilla nhằm thay đổi cách Firefox quản lý trạng thái phía máy khách (tức là dữ liệu được lưu trong trình duyệt) để giảm khả năng các website lạm dụng trạng thái cho việc theo dõi liên trang, tức là thông qua [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies).

Nỗ lực này nhằm đạt được điều đó bằng cách cung cấp một vị trí lưu trữ được phân vùng cho mọi website mà người dùng truy cập.
Bài viết này cung cấp tổng quan về cơ chế này, liệt kê các API bị ảnh hưởng và giải thích cách gỡ lỗi các site bị ảnh hưởng.

Từ Firefox 103, Phân vùng trạng thái được bật theo mặc định.

## Động lực

### Theo dõi liên trang bằng trạng thái dùng chung

Trình duyệt theo truyền thống gắn trạng thái phía máy khách theo origin (hoặc đôi khi theo domain có thể đăng ký) của vị trí mà một tài nguyên được tải từ đó.
Ví dụ, cookies, đối tượng localStorage, và cache có sẵn cho một iframe được tải từ `https://example.com/hello.html` sẽ được gắn theo `example.com`.
Điều này đúng bất kể trình duyệt hiện đang tải tài nguyên từ domain đó như tài nguyên _bên thứ nhất_ hay như tài nguyên _bên thứ ba_ được nhúng.
Các bộ theo dõi đã tận dụng trạng thái liên trang này để lưu mã định danh người dùng và truy cập chúng trên nhiều website.
Ví dụ bên dưới cho thấy `example.com` có thể dùng trạng thái liên trang của nó (trong trường hợp này là cookies) để theo dõi một người dùng trên site của chính nó cũng như `A.example` và `B.example`.

![Ví dụ về trạng thái liên trang](example-cross-site-state.png)

### Các cách tiếp cận trước đây để chặn theo dõi liên trang

Các chính sách cookie trước đây của Firefox cố gắng giảm theo dõi bằng cách chặn quyền truy cập vào một số API lưu trữ (ví dụ: cookies và localStorage) cho một số domain nhất định trong một số điều kiện nhất định.
Ví dụ, chính sách "chặn toàn bộ cookie bên thứ ba" của chúng tôi sẽ ngăn mọi domain truy cập vào một số API lưu trữ khi được tải trong ngữ cảnh bên thứ ba.
Chính sách cookie [mặc định](/en-US/docs/Web/Privacy/Guides/Storage_Access_Policy) hiện tại của chúng tôi chỉ chặn quyền truy cập trong ngữ cảnh bên thứ ba đối với các domain được phân loại là tracker.

## Phân vùng trạng thái

Phân vùng trạng thái là một cách tiếp cận khác để ngăn chặn theo dõi liên trang.
Thay vì chặn quyền truy cập vào một số API có trạng thái trong ngữ cảnh bên thứ ba, Firefox cung cấp cho các tài nguyên được nhúng một kho lưu trữ riêng biệt cho mỗi website cấp cao nhất.
Cụ thể hơn, Firefox gắn kép toàn bộ trạng thái phía máy khách theo [origin](https://html.spec.whatwg.org/multipage/browsers.html#origin) của tài nguyên đang được tải và theo [site](https://html.spec.whatwg.org/multipage/browsers.html#site) cấp cao nhất.
Trong hầu hết trường hợp, site cấp cao nhất là scheme và {{glossary("registrable domain")}} của trang cấp cao nhất mà người dùng đang truy cập.

Trong ví dụ bên dưới, `example.com` được nhúng trong `A.example` và `B.example`.
Tuy nhiên, vì lưu trữ được phân vùng, có ba kho lưu trữ khác nhau (thay vì một).
Bộ theo dõi vẫn có thể truy cập lưu trữ, nhưng vì mỗi kho lưu trữ còn được gắn thêm site cấp cao nhất, dữ liệu nó truy cập được trên A sẽ khác với dữ liệu trên B.
Điều này sẽ ngăn một bộ theo dõi lưu mã định danh trong cookies của họ khi được truy cập trực tiếp rồi sau đó truy xuất mã định danh đó khi được nhúng trên các website khác.

![Ví dụ về phân vùng trạng thái](example-state-partitioning.png)

## Tiêu chuẩn hóa

[Privacy Community Group](https://privacycg.github.io/) có một Work Item cho [Client-Side Storage Partitioning](https://privacycg.github.io/storage-partitioning/).
Nó cung cấp tổng quan về các nỗ lực tiêu chuẩn hóa cho việc phân vùng lưu trữ trong từng tiêu chuẩn bị ảnh hưởng.
Chúng tôi dự định đồng bộ hóa việc triển khai phân vùng trạng thái của mình với các nỗ lực này khi Work Item đó được tiêu chuẩn hóa.

### Trạng thái phân vùng trong Firefox

- [**Network Partitioning**](#network_partitioning): Được bật theo mặc định cho mọi người dùng từ Firefox 85.
- [**Dynamic Partitioning**](#dynamic_partitioning): Được bật theo mặc định cho mọi người dùng từ Firefox 103. Trước đó:
  - Từ Firefox 86: Bật cho người dùng đã bật ["Strict" privacy protections](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop#w_strict-enhanced-tracking-protection).
  - Từ Firefox 90: Bật trong duyệt web riêng tư.

## Phân vùng tĩnh

### Phân vùng lưu trữ

Để ngăn các API lưu trữ có thể truy cập bằng JavaScript bị dùng cho theo dõi liên trang, lưu trữ có thể truy cập được được phân vùng theo site cấp cao nhất.
Cơ chế này có nghĩa là, nhìn chung, một bên thứ ba được nhúng trong một site cấp cao nhất sẽ không thể truy cập dữ liệu được lưu dưới site cấp cao nhất khác.

### Các API lưu trữ

- [localStorage](/en-US/docs/Web/API/Window/localStorage)
- [sessionStorage](/en-US/docs/Web/API/Window/sessionStorage)
- [DOM Cache](/en-US/docs/Web/API/Cache)
- [IndexedDB](/en-US/docs/Web/API/IndexedDB_API)
- [Broadcast Channel](/en-US/docs/Web/API/BroadcastChannel)
- [Shared Workers](/en-US/docs/Web/API/SharedWorker)
- [Service Workers](/en-US/docs/Web/API/Service_Worker_API)

### Phân vùng mạng

Các API liên quan đến mạng không được thiết kế để dùng cho website lưu trữ dữ liệu, nhưng chúng có thể bị [lạm dụng](https://blog.mozilla.org/security/2021/01/26/supercookie-protections/) để theo dõi liên trang.
Vì vậy, các API và cache mạng sau đây được phân vùng **vĩnh viễn** theo site cấp cao nhất.

> [!NOTE]
> Network Partitioning là vĩnh viễn.
> Website không thể kiểm soát hoặc nới lỏng các hạn chế này.

### Các API mạng

- [HTTP Cache](/en-US/docs/Web/HTTP/Guides/Caching)
- Image Cache
- Favicon Cache
- Connection Pooling
- Script Cache
- Stylesheet Cache
- [DNS](/en-US/docs/Glossary/DNS)
- HTTP Authentication
- [Alt-Svc](/en-US/docs/Web/HTTP/Reference/Headers/Alt-Svc)
- Speculative Connections
- Fonts & Font Cache
- [HSTS](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security)
- OCSP
- Intermediate CA Cache
- TLS Client Certificates
- TLS Session Identifiers
- Prefetch
- Preconnect
- [CORS-preflight](/en-US/docs/Glossary/Preflight_request) Cache
- WebRTC deviceID
- {{glossary("bfcache","Backward/forward cache (bfcache)")}}

## Phân vùng động

Nhìn chung, nếu lưu trữ có thể truy cập được được phân vùng theo site cấp cao nhất, quyền truy cập vào cookie chưa phân vùng của bên thứ ba vẫn có thể được cấp nếu hỗ trợ Storage Access API:

- dùng [Storage Access API](#storage_access_api).
- tự động, chẳng hạn đối với bên thứ ba cung cấp đăng nhập liên kết (federated login).

Chi tiết về các quyền tự động được nêu trong phần [Storage Access Heuristics](#storage_access_heuristics).

### Các API được phân vùng động

- [Cookies](/en-US/docs/Web/API/Document/cookie)

### Các heuristic truy cập lưu trữ

Để cải thiện khả năng tương thích web, Firefox hiện bao gồm một số heuristic để tự động cấp quyền truy cập cookie chưa phân vùng cho bên thứ ba có nhận tương tác người dùng.
Các heuristic này nhằm cho phép một số tích hợp bên thứ ba phổ biến trên web tiếp tục hoạt động.

> [!WARNING]
> Storage access heuristics là một tính năng chuyển tiếp nhằm ngăn website bị hỏng.
> Không nên dựa vào chúng cho việc phát triển web hiện tại và tương lai.

#### Opener Heuristic

Khi một bên thứ ba đã được phân vùng mở một cửa sổ bật lên có [opener access](/en-US/docs/Web/API/Window/opener) tới tài liệu gốc và người dùng tương tác với popup đó, bên thứ ba sẽ được cấp quyền truy cập lưu trữ tới embedder của nó trong 30 ngày.

#### Navigation Heuristic

Giả sử một site được lưu trữ tại `a.example` điều hướng người dùng tới `b.example` trong cùng một cửa sổ, người dùng tương tác với `b.example`, rồi người dùng nhanh chóng được điều hướng trở lại `a.example`. Trong trường hợp như vậy, `b.example` được cấp quyền truy cập lưu trữ như một bên thứ ba trên `a.example` trong 30 ngày.

## Storage Access API

Các frame bên thứ ba có thể dùng
[document.requestStorageAccess](/en-US/docs/Web/API/Document/requestStorageAccess) để yêu cầu quyền truy cập chưa phân vùng vào cookie thông qua [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).
Khi được cấp, bên yêu cầu sẽ có quyền truy cập vào toàn bộ cookie bên thứ nhất của nó (tức là các cookie mà nó sẽ có quyền truy cập nếu được truy cập như bên thứ nhất).

> [!WARNING]
> Khi quyền truy cập lưu trữ được cấp, vẫn có thể còn các tham chiếu tới lưu trữ đã phân vùng.
> Tuy nhiên, các site không nên dựa vào việc có thể dùng đồng thời cookie đã phân vùng và chưa phân vùng.

## Gỡ lỗi

Chúng tôi khuyến khích chủ site kiểm thử site của họ, đặc biệt là những site dựa vào tích hợp nội dung bên thứ ba.
Firefox có một số tính năng giúp việc kiểm thử dễ dàng hơn.

### Ghi nhật ký

Sau đây là tổng quan về các thông điệp được ghi vào web console khi tương tác với lưu trữ trong ngữ cảnh bên thứ ba.
Trong các ví dụ sau, `a.example` là site cấp cao nhất nhúng frame bên thứ ba `b.example`.

| Lý do                                                                                                                             | Thông điệp trong console                                                                                                                              |
| --------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lưu trữ của một frame bên thứ ba được phân vùng                                                                                   | Partitioned cookie or storage access was provided to "b.example" because it is loaded in the third-party context and storage partitioning is enabled. |
| Quyền truy cập vào cookie chưa phân vùng được cấp thông qua [Storage access heuristics](#storage_access_heuristics)               | Storage access automatically granted for First-Party isolation "b.example" on "a.example".                                                            |
| Quyền truy cập vào cookie chưa phân vùng được cấp thông qua [StorageAccessAPI](/en-US/docs/Web/API/Document/requestStorageAccess) | Storage access granted for origin "b.example" on "a.example".                                                                                         |

### Xóa quyền truy cập lưu trữ bên thứ ba

Nếu một iframe bên thứ ba được cấp quyền truy cập lưu trữ tới ngữ cảnh cha, Firefox sẽ đặt một quyền.
Để thu hồi quyền truy cập, bạn có thể xóa quyền đó thông qua [Site Information Panel](https://support.mozilla.org/en-US/kb/site-information-panel) trong phần quyền dưới mục "Cross-site Cookies".

### Tùy chọn kiểm thử

> [!WARNING]
> Hãy bảo đảm đặt các tùy chọn này trong một hồ sơ Firefox riêng hoặc đặt lại chúng sau khi kiểm thử.

#### Tắt các tính năng tương thích web

Đặt `privacy.antitracking.enableWebcompat` thành `false` sẽ **tắt** tất cả các tính năng tương thích web của ETP và State Partitioning.
Việc tắt các tính năng này có thể hữu ích khi kiểm thử, để bảo đảm website của bạn tương thích hoàn toàn với cơ chế State Partitioning trong Firefox, và không dựa vào các heuristic tạm thời.

Các tính năng bị vô hiệu hóa bởi pref này bao gồm:

- [Storage access heuristics](#storage_access_heuristics): Quyền truy cập cookie chưa phân vùng chỉ có thể có thông qua Storage Access API.
- Tự động cấp quyền truy cập lưu trữ: [document.requestStorageAccess](/en-US/docs/Web/API/Document/requestStorageAccess) sẽ luôn hỏi người dùng.
- Tính năng [SmartBlock's "unblock on opt-in" feature](https://blog.mozilla.org/security/2021/07/13/smartblock-v2/), vốn sẽ cho phép một số tracker khi người dùng tương tác với chúng.
- Bất kỳ [anti-tracking exceptions](https://wiki.mozilla.org/Security/Anti_tracking_policy#Temporary_Web_Compatibility_Interventions) tạm thời nào được cấp cho website thông qua cơ chế skip-listing.

#### Tắt heuristic

Các tùy chọn sau có thể được dùng để tắt từng heuristic truy cập lưu trữ riêng lẻ thông qua [config editor](https://support.mozilla.org/en-US/kb/about-config-editor-firefox):

- Bật / tắt [navigation heuristic](#navigation_heuristic): `privacy.restrict3rdpartystorage.heuristic.navigation`
- Bật / tắt [opener heuristic](#opener_heuristic): `privacy.restrict3rdpartystorage.heuristic.opened_window_after_interaction`

#### Tắt phân vùng mạng

Có thể tắt phân vùng mạng bằng pref `privacy.partition.network_state`.

#### Tắt phân vùng trạng thái động

Để tắt phân vùng lưu trữ động cho tất cả site, bạn có thể dùng tùy chọn `network.cookie.cookieBehavior`:

| Giá trị | Mô tả                                               |
| ------- | --------------------------------------------------- |
| 5       | Phân vùng lưu trữ bên thứ ba.                       |
| 4       | Từ chối tracker (Phân vùng lưu trữ bị tắt).         |
| 0       | Cho phép tất cả lưu trữ (Phân vùng lưu trữ bị tắt). |

Các giá trị khác của tùy chọn này có thể vô hiệu hóa hoàn toàn lưu trữ bên thứ ba.

#### Loại trừ các origin cụ thể khỏi phân vùng

Phân vùng trạng thái động cũng có thể được tắt cho các origin cụ thể bằng tùy chọn `privacy.restrict3rdpartystorage.skip_list`.
Pref này giữ một danh sách các origin, phân tách bằng dấu phẩy, để loại trừ.
Giá trị pref nên theo định dạng sau: `first-party_origin_1,third-party_origin_1;first-party_origin_2,third-party_origin_2;...`.

Ví dụ, để tắt phân vùng cho `tracker.example` trên `example.com` hoặc `social.example` trên `news.example` bạn sẽ đặt pref thành như sau:

```plain
https://example.com,https://tracker.example;https://news.example,https://social.example
```

Bạn có thể dùng `*` làm ký tự đại diện cho cả bên thứ nhất hoặc bên thứ ba.
Ví dụ, để tắt phân vùng cho `videos.example` trên mọi site, hoặc để tắt toàn bộ phân vùng trên `unpartitioned.example`, bạn sẽ đặt pref thành như sau:

```plain
*,https://videos.example;unpartitioned.example,*
```
