---
title: Bảo vệ chống theo dõi chuyển hướng
slug: Web/Privacy/Guides/Redirect_tracking_protection
page-type: guide
sidebar: privacy
---

Kể từ phiên bản 79, Firefox đã bảo vệ người dùng khỏi **redirect tracking** bằng cách định kỳ xóa cookie và dữ liệu trang web do các trình theo dõi đã biết thiết lập. Dữ liệu này chỉ bị xóa khỏi bộ nhớ nếu người dùng đang [chặn cookie theo dõi](/en-US/docs/Web/Privacy/Guides/Storage_Access_Policy) (tức là thuộc tính `network.cookie.cookieBehavior` được đặt thành `4`).

> [!NOTE]
> Bài viết này nói về cơ chế theo dõi chuyển hướng/bounce tracking ban đầu của Firefox, cơ chế này hiện đã được thay thế bởi [bounce tracking mitigations](/en-US/docs/Web/Privacy/Guides/Bounce_tracking_mitigations).

Hỗ trợ cho các chính sách cookie khác đang được theo dõi trong [Bug 1643045](https://bugzil.la/1643045).

## Định nghĩa redirect tracking

Redirect tracking là hành vi lạm dụng điều hướng giữa các trang web, trong đó một trình theo dõi tạm thời chuyển hướng người dùng đến trang web của chính nó với mục đích dùng bộ nhớ phía trước để theo dõi người dùng đó trên nhiều trang web.

Điều hướng giữa các trang web là một tính năng cốt lõi của web; một người có thể tìm kiếm "best running shoes" trên công cụ tìm kiếm, bấm vào một kết quả để đọc đánh giá, rồi cuối cùng bấm vào một liên kết để mua giày từ một cửa hàng trực tuyến. Trước đây, mỗi trang web này có thể nhúng tài nguyên từ cùng một trình theo dõi, và trình theo dõi có thể dùng cookie của nó để liên kết tất cả lượt truy cập trang này với cùng một người. Để bảo vệ quyền riêng tư của người dùng, trình duyệt chặn các trình theo dõi dùng cookie khi chúng được nhúng trong ngữ cảnh bên thứ ba (ví dụ xem [Enhanced Tracking Protection](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop) (ETP) của Firefox), nhưng vẫn cho phép chúng dùng cookie như bên thứ nhất vì việc chặn cookie bên thứ nhất sẽ khiến trang web bị hỏng. Redirect tracking lợi dụng điều này để vượt qua việc chặn cookie bên thứ ba.

Các trình theo dõi chuyển hướng hoạt động bằng cách buộc bạn dừng lại trong chốc lát trên trang web của chúng như một phần của hành trình đó. Vì vậy, thay vì điều hướng trực tiếp từ trang đánh giá đến nhà bán lẻ, bạn sẽ chuyển đến trình theo dõi chuyển hướng trước rồi mới đến nhà bán lẻ. Điều này có nghĩa là trình theo dõi được tải dưới dạng bên thứ nhất. Trình theo dõi chuyển hướng gắn dữ liệu theo dõi với các định danh mà nó đã lưu trong cookie bên thứ nhất của mình, rồi chuyển bạn tiếp đến nhà bán lẻ.

## Những origin nào sẽ bị xóa?

Một origin sẽ bị xóa nếu nó thỏa các điều kiện sau:

1. Nó đã lưu cookie hoặc đã truy cập vào bộ nhớ trang web khác (ví dụ [localStorage](/en-US/docs/Web/API/Web_Storage_API), [IndexedDB](/en-US/docs/Web/API/IndexedDB_API), hoặc [Cache API](/en-US/docs/Web/API/CacheStorage)) trong vòng 72 giờ gần nhất. Vì cookie được tính theo host, chúng tôi sẽ xóa cả biến thể origin `http` và `https` của host đó.
2. Origin đó được [phân loại là trình theo dõi](/en-US/docs/Web/Privacy/Guides/Storage_Access_Policy#tracking_protection_explained) trong danh sách Tracking Protection của chúng tôi.
3. Không có origin nào có cùng {{glossary("registrable domain")}} và có quyền tương tác người dùng.
   - Quyền này được cấp cho một origin trong 45 ngày sau khi người dùng tương tác với tài liệu cấp cao nhất từ origin đó. "Tương tác" bao gồm cả cuộn trang.
   - Mặc dù quyền này được lưu ở cấp origin, chúng tôi sẽ kiểm tra xem có origin nào có cùng miền gốc hay không, để tránh làm hỏng các trang có nhiều subdomain và cấu hình cookie tương ứng.

## Dữ liệu nào sẽ bị xóa?

Firefox sẽ xóa [các dữ liệu sau](https://searchfox.org/firefox-main/rev/9767e215f62521af8168bfb6fb4275755868f0db/toolkit/components/antitracking/PurgeTrackerService.jsm#209-225):

- Bộ nhớ đệm mạng và bộ nhớ đệm ảnh
- Cookie
- AppCache
- DOM Quota Storage (localStorage, IndexedDB, ServiceWorkers, DOM Cache, v.v.)
- Thông báo DOM Push
- Reporting API Reports
- Security Settings (tức là HSTS)
- Dữ liệu EME Media Plugin
- Dữ liệu plugin (ví dụ Flash)
- Thiết bị media
- Quyền Storage Access đã được cấp cho origin
- HTTP Authentication Tokens
- HTTP Authentication Cache

> [!NOTE]
> Mặc dù chúng tôi xóa tất cả dữ liệu này, hiện tại chúng tôi chỉ đánh dấu origin để xóa khi chúng dùng cookie hoặc bộ nhớ trang web khác.

Việc xóa bộ nhớ bỏ qua các thuộc tính origin. Điều này có nghĩa là bộ nhớ sẽ bị xóa trên toàn bộ [containers](https://wiki.mozilla.org/Security/Contextual_Identity_Project/Containers) và bộ nhớ cô lập (tức là từ [First-Party Isolation](/en-US/docs/Mozilla/Add-ons/WebExtensions/API/cookies#first-party_isolation)).

## Dữ liệu được xóa với tần suất như thế nào?

Firefox xóa bộ nhớ dựa trên việc kích hoạt một sự kiện nội bộ có tên `idle-daily`, được xác định bởi các điều kiện sau:

- Sớm nhất là 24h sau khi sự kiện `idle-daily` gần nhất được kích hoạt.
- Chỉ kích hoạt nếu người dùng đã ở trạng thái nhàn rỗi ít nhất 3 phút (trong 24-48h sau lần `idle-daily` gần nhất) hoặc 1 phút (trong >48h sau lần `idle-daily` gần nhất).

Điều này có nghĩa là có ít nhất 24 giờ giữa mỗi lần xóa bộ nhớ, và bộ nhớ chỉ được xóa khi trình duyệt ở trạng thái nhàn rỗi. Khi xóa cookie, chúng tôi sắp xếp cookie theo ngày tạo và gom chúng thành các lô 100 cookie (được điều khiển bởi thuộc tính `privacy.purge_trackers.max_purge_count`) vì lý do hiệu năng.

## Gỡ lỗi

Bạn có thể bật hoặc tắt tính năng bảo vệ chống theo dõi chuyển hướng bằng cách chuyển thuộc tính `privacy.purge_trackers.enabled` trong `about:config`. Ngoài ra, tính năng này chỉ chạy nếu thuộc tính `network.cookie.cookieBehavior` được đặt là `4` hoặc `5` trong Firefox 79+ (`1`, `3`, `4`, hoặc `5` tính đến Firefox 80).

Có thể đặt các mức ghi log khác nhau thông qua thuộc tính `privacy.purge_trackers.logging.level`.

Để gỡ lỗi, cách dễ nhất để kích hoạt xóa bộ nhớ là gọi trực tiếp dịch vụ qua [dòng lệnh Browser Console](https://firefox-source-docs.mozilla.org/devtools-user/browser_console/index.html#browser-console-command-line). Lưu ý rằng điều này khác với [Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html) thông thường mà bạn có thể dùng để gỡ lỗi một trang web, và cần đặt thuộc tính `devtools.chrome.enabled` thành `true` để dùng tương tác. Sau khi bật Browser Console, bạn có thể kích hoạt xóa bộ nhớ bằng cách chạy lệnh sau:

```js
await Components.classes["@mozilla.org/purge-tracker-service;1"]
  .getService(Components.interfaces.nsIPurgeTrackerService)
  .purgeTrackingCookieJars();
```

Thời gian cho đến khi quyền tương tác người dùng hết hạn có thể được đặt về mức thấp hơn bằng thuộc tính `privacy.userInteraction.expiration`. Lưu ý rằng bạn sẽ phải đặt thuộc tính này trước khi truy cập các trang web bạn muốn kiểm thử - nó sẽ không áp dụng hồi tố.

## Các triển khai khác

WebKit lần đầu tiên phát hành redirect tracking protection trong [ITP 2.0](https://webkit.org/blog/8311/intelligent-tracking-prevention-2-0/) (họ gọi cùng cuộc tấn công này là bounce tracking). Tính đến tháng 7 năm 2020, có một số khác biệt đáng kể giữa cách triển khai của WebKit và của Firefox:

- Danh sách các origin sẽ bị xóa trong Firefox dựa trên [tracking protection list](/en-US/docs/Web/Privacy/Guides/Storage_Access_Policy#tracking_protection_explained) của chúng tôi; WebKit dựa vào phân loại của ITP.
- Định nghĩa "tương tác" của Firefox bao gồm cả việc người dùng cuộn trang khi truy cập origin với tư cách bên thứ nhất; WebKit thì không.
- Firefox sẽ không xóa dữ liệu của một origin nếu nó đã nhận được tương tác ở vai trò bên thứ nhất trong 45 ngày dương lịch gần nhất; cửa sổ tương tác của WebKit là 30 ngày sử dụng trình duyệt (ví dụ, những ngày mà người dùng có ít nhất một tương tác với Safari).
