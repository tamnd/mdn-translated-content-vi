---
title: "Chính sách truy cập lưu trữ: Chặn cookie từ trình theo dõi"
short-title: Chính sách truy cập lưu trữ
slug: Web/Privacy/Guides/Storage_Access_Policy
page-type: guide
sidebar: privacy
---

Firefox bao gồm một chính sách truy cập lưu trữ mới chặn cookie và dữ liệu trang web khác từ các tài nguyên theo dõi bên thứ ba. Chính sách này được thiết kế như một giải pháp thay thế cho các chính sách cookie cũ hơn, đã có sẵn trong Firefox trong nhiều năm. Chính sách này bảo vệ chống lại theo dõi cross-site trong khi giảm thiểu sự cố trang web liên quan đến chặn cookie truyền thống. Bài viết này giải thích cách chính sách hoạt động và cách bạn có thể kiểm tra nó.

## Kiểm tra trong Firefox

Chính sách cookie này đã có sẵn trong Firefox từ phiên bản 63. Tài liệu này mô tả chính sách mà chúng tôi dự định phát hành cho người dùng Firefox Release, nhưng có thể không khớp với những gì được triển khai trong phiên bản Release hiện tại của Firefox. Đó là vì chúng tôi ghi lại các khía cạnh mới của chính sách ngay khi chúng xuất hiện trong [Firefox Nightly](https://www.firefox.com/en-US/channel/desktop/#nightly), kênh phát hành trước của chúng tôi. Firefox Nightly cũng có thể chứa các tính năng thử nghiệm mà chúng tôi chưa có kế hoạch phát hành cho người dùng Release; các tính năng thử nghiệm sẽ không được đưa vào tài liệu này, nhưng vẫn có thể ảnh hưởng đến chức năng của các tên miền được phân loại là trình theo dõi.

Chúng tôi khuyến nghị các trang web kiểm tra với [Firefox Nightly](https://www.firefox.com/en-US/channel/desktop/#nightly), vì bao gồm phiên bản mới nhất của các biện pháp bảo vệ của chúng tôi. Như mô tả ở trên, lưu ý rằng Nightly có thể bao gồm các biện pháp bảo vệ bổ sung cuối cùng bị xóa hoặc thay đổi trước khi chúng đến người dùng Release của chúng tôi. Chúng tôi sẽ cập nhật trang này với thông tin mới nhất khi chúng tôi tăng cường các biện pháp bảo vệ của mình.

Các biện pháp bảo vệ này mặc định được bật trong Nightly. Chính sách cookie có thể được kích hoạt trong các phiên bản khác của Firefox thông qua [cài đặt Chặn Nội dung](https://support.mozilla.org/en-US/kb/content-blocking) (các bước này sẽ khác nhau theo phiên bản; tài liệu được liên kết bao gồm một danh sách thả xuống để chọn phiên bản Firefox phù hợp).

### Báo cáo các trang web bị hỏng

Nếu bạn tìm thấy một trang web bị hỏng do thay đổi này, hãy nộp một lỗi dưới thành phần Tracking Protection trong sản phẩm Firefox trên [Bugzilla](https://bugzilla.mozilla.org/enter_bug.cgi?assigned_to=nobody%40mozilla.org&blocked=1480137&bug_file_loc=http%3A%2F%2F&bug_ignored=0&bug_severity=normal&bug_status=NEW&cf_fx_iteration=---&cf_fx_points=---&cf_platform_rel=---&cf_status_firefox62=---&cf_status_firefox63=---&cf_status_firefox64=---&cf_status_firefox_esr60=---&cf_status_geckoview62=---&cf_tracking_firefox62=---&cf_tracking_firefox63=---&cf_tracking_firefox64=---&cf_tracking_firefox_esr60=---&cf_tracking_firefox_relnote=---&cf_tracking_geckoview62=---&component=Tracking%20Protection&contenttypemethod=list&contenttypeselection=text%2Fplain&defined_groups=1&flag_type-203=X&flag_type-37=X&flag_type-41=X&flag_type-5=X&flag_type-607=X&flag_type-721=X&flag_type-737=X&flag_type-748=X&flag_type-787=X&flag_type-799=X&flag_type-800=X&flag_type-803=X&flag_type-835=X&flag_type-846=X&flag_type-855=X&flag_type-864=X&flag_type-914=X&flag_type-916=X&flag_type-929=X&flag_type-930=X&flag_type-933=X&form_name=enter_bug&maketemplate=Remember%20values%20as%20bookmarkable%20template&op_sys=Unspecified&priority=--&product=Firefox&rep_platform=Unspecified&target_milestone=---&version=unspecified). Ngoài ra, bạn có thể báo cáo các trang web bị hỏng trực tiếp trong Firefox bằng cách nhấp vào "Báo cáo vấn đề" trong phần Chặn Nội dung của [Control Center](https://support.mozilla.org/en-US/kb/site-information-panel) (phím tắt này có thể không có sẵn trong tất cả các phiên bản của Firefox).

## Giải thích bảo vệ theo dõi

Firefox xác định tài nguyên nào là tài nguyên theo dõi như thế nào?

Firefox sử dụng danh sách Bảo vệ Theo dõi để xác định tài nguyên nào là tài nguyên theo dõi. Danh sách Bảo vệ Theo dõi được [duy trì bởi Disconnect](https://github.com/disconnectme/disconnect-tracking-protection/issues). Khi danh sách được áp dụng trong Firefox, chúng tôi thực hiện hai thay đổi quan trọng:

- Đầu tiên, chúng tôi chỉ sử dụng phiên bản "Bảo vệ Cơ bản" của danh sách, [loại trừ một số danh mục trình theo dõi](https://github.com/mozilla-services/shavar-prod-lists#disconnect-blacklistjson). Trong tương lai, chúng tôi có thể mở rộng biện pháp bảo vệ của mình để sử dụng phiên bản "Bảo vệ Nghiêm ngặt" của danh sách.
- Thứ hai, Firefox sử dụng thêm một "[danh sách thực thể](https://github.com/mozilla-services/shavar-prod-lists/blob/master/disconnect-entitylist.json)", ngăn [các tên miền bị phân loại là trình theo dõi khi chúng được tải trên trang cấp cao nhất thuộc sở hữu của cùng một tổ chức](https://github.com/mozilla-services/shavar-prod-lists#disconnect-entitylistjson).

Firefox sử dụng bộ phân loại URL [Bảo vệ Theo dõi](https://support.mozilla.org/en-US/kb/what-happened-tracking-protection) tích hợp để xác định tài nguyên nào khớp với danh sách bảo vệ theo dõi. Các tên miền được khớp với danh sách theo [đặc tả SafeBrowsing v4](https://developers.google.com/safe-browsing/v4/urls-hashing#suffixprefix-expressions). Cụ thể, chúng tôi kiểm tra tên máy chủ chính xác của tài nguyên với danh sách, cũng như bốn tên máy chủ cuối cùng được hình thành bằng cách bắt đầu với năm thành phần cuối cùng và liên tiếp loại bỏ thành phần đầu dẫn. Xem xét các ví dụ sau:

| Tên máy chủ trong danh sách | Tên máy chủ của tài nguyên | Khớp  |
| --------------------------- | -------------------------- | ----- |
| `example.com`               | `example.com`              | Có    |
| `example.com`               | `a.b.example.com`          | Có    |
| `blah.example.com`          | `example.com`              | Không |
| `a.b.example.com`           | `c.d.example.com`          | Không |
| `blah.example.com`          | `foo.blah.example.com`     | Có    |

## Chính sách truy cập lưu trữ chặn gì?

Chính sách truy cập lưu trữ chặn các tài nguyên được xác định là trình theo dõi khỏi việc truy cập [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và lưu trữ trang web khác được tải trong ngữ cảnh bên thứ ba. Điều này ngăn những tài nguyên đó truy xuất các định danh theo dõi và sử dụng chúng để xác định người dùng qua các lần truy cập nhiều bên đầu tiên. Cụ thể, Firefox làm điều này bằng cách áp đặt các hạn chế sau:

Cookie:

- Chặn các request header {{httpheader("Cookie")}} và bỏ qua các response header {{httpheader("Set-Cookie")}}.
- Trả về một chuỗi rỗng cho các cuộc gọi đến {{domxref("Document.cookie")}} và bỏ qua các yêu cầu đặt cookie qua `Document.cookie`.

Lưu trữ DOM:

- [localStorage](/en-US/docs/Web/API/Web_Storage_API): [`Window.localStorage`](/en-US/docs/Web/API/Window/localStorage): các lần thử đọc và ghi ném ngoại lệ `SecurityError`. Trước Firefox 70: [`Window.localStorage`](/en-US/docs/Web/API/Window/localStorage) là `null`. Do đó, các lần thử đọc và ghi bằng đối tượng này sẽ ném ngoại lệ `TypeError`.
- [sessionStorage](/en-US/docs/Web/API/Web_Storage_API): các lần thử đọc và ghi được phép.
- [IndexedDB](/en-US/docs/Web/API/IndexedDB_API): cố gắng truy cập đối tượng factory IndexedDB ném ngoại lệ `SecurityError`.

Nhắn tin và Workers:

- [Broadcast Channel](/en-US/docs/Web/API/Broadcast_Channel_API): các lần thử tạo {{domxref("BroadcastChannel")}} mới sẽ ném ngoại lệ `SecurityError`.
- [Shared Worker](/en-US/docs/Web/API/Web_Workers_API): các lần thử tạo {{domxref("SharedWorker")}} mới sẽ ném ngoại lệ `SecurityError`.
- [Service Worker](/en-US/docs/Web/API/Service_Worker_API): các lần thử tạo {{domxref("ServiceWorker")}} mới sẽ ném ngoại lệ `SecurityError`.

Cache DOM:

- Các cuộc gọi đến {{domxref("CacheStorage")}} sẽ luôn từ chối với `SecurityError`.

Cache trình duyệt:

- [HTTP cache](/en-US/docs/Web/HTTP/Guides/Caching), Image cache, và [Alternative Services (Alt-Svc) cache](/en-US/docs/Web/HTTP/Reference/Headers/Alt-Svc) đều được phân vùng cho các tài nguyên theo dõi, sao cho mỗi nguồn gốc cấp cao nhất sẽ có một phân vùng riêng biệt và các tài nguyên theo dõi trên các nguồn gốc cấp cao nhất khác nhau sẽ được lưu cache riêng biệt nhau.

Kết nối mạng:

- [Phiên TLS](https://wiki.mozilla.org/Security/Server_Side_TLS#Session_Resumption) sẽ không được tiếp tục bằng cách sử dụng vé phiên khi kết nối HTTPS được thực hiện với tài nguyên bên thứ ba nhúng được phân loại là trình theo dõi.
- [Tái sử dụng kết nối HTTP](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x#persistent_connections) bởi các tên miền được phân loại là trình theo dõi bị giới hạn đối với các yêu cầu xảy ra dưới cùng một nguồn gốc cấp cao nhất.

Referrer HTTP

- [Chính sách Referrer](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy) mặc định cho các tài nguyên bên thứ ba được phân loại là trình theo dõi được đặt thành `strict-origin-when-cross-origin`.

### Chính sách không chặn gì?

1. Chính sách này hiện không hạn chế truy cập lưu trữ bên thứ ba cho các tài nguyên không được phân loại là tài nguyên theo dõi. Chúng tôi có thể chọn áp dụng các hạn chế bổ sung cho truy cập lưu trữ bên thứ ba trong tương lai.
2. Các hạn chế được áp dụng bởi chính sách sẽ không ngăn các script bên thứ ba được phân loại là tài nguyên theo dõi khỏi việc truy cập lưu trữ trong ngữ cảnh chính của trang. Những script này có thể tiếp tục sử dụng lưu trữ được phân tầm đến nguồn gốc cấp cao nhất.
3. Các nguồn gốc được phân loại là trình theo dõi sẽ có quyền truy cập vào lưu trữ của chính họ khi chúng được tải trong ngữ cảnh bên đầu tiên.
4. Các tài nguyên cross-origin được tải từ cùng {{glossary("registrable domain")}} như ngữ cảnh cấp cao nhất vẫn sẽ có quyền truy cập vào lưu trữ của chúng.
5. Các nguồn gốc thông thường được phân loại là trình theo dõi sẽ [không bị chặn nếu nguồn gốc trang cấp cao nhất được xác định là từ cùng tổ chức với chúng](https://github.com/mozilla-services/shavar-prod-lists#entity-list).

## Cấp phép truy cập lưu trữ

Để cải thiện khả năng tương thích web và cho phép tích hợp bên thứ ba yêu cầu truy cập lưu trữ, Firefox sẽ cấp quyền truy cập lưu trữ được phân tầm đến bên đầu tiên cho một nguồn gốc bên thứ ba cụ thể như mô tả trong phần này. Hiện tại, Firefox bao gồm một số heuristic tương thích web cấp quyền truy cập lưu trữ cho các tài nguyên bên thứ ba được phân loại là trình theo dõi khi người dùng tương tác với các bên thứ ba đó. Chúng tôi làm điều này khi chúng tôi mong đợi rằng việc không cấp quyền truy cập sẽ khiến trang web bị hỏng. Chúng tôi cũng hỗ trợ triển khai ban đầu của [Storage Access API](/en-US/docs/Web/API/Storage_Access_API), thông qua đó các {{htmlelement("iframe")}} nhúng có thể yêu cầu quyền truy cập lưu trữ bằng cách gọi {{domxref("Document.requestStorageAccess()")}}. Mặc dù cả hai cách tiếp cận này đều cung cấp cùng mức độ truy cập lưu trữ, chúng tôi khuyến nghị các bên thứ ba chuyển sang sử dụng Storage Access API để đảm bảo quyền truy cập lưu trữ của họ.

### Tự động cấp quyền truy cập lưu trữ khi tương tác

Để cải thiện khả năng tương thích web, Firefox hiện bao gồm một số heuristic để tự động cấp quyền truy cập lưu trữ cho các bên thứ ba nhận được tương tác của người dùng. Các heuristic này được thiết kế để cho phép một số tích hợp bên thứ ba phổ biến trên web tiếp tục hoạt động. Chúng được thiết kế là tạm thời và sẽ bị xóa trong phiên bản tương lai của Firefox. Không nên dựa vào chúng cho phát triển web hiện tại và tương lai.

Quyền truy cập lưu trữ bên thứ ba có thể được cấp khi cử chỉ của người dùng kích hoạt một cửa sổ popup có [quyền truy cập opener](/en-US/docs/Web/API/Window/opener) vào tài liệu gốc. Nếu người dùng tương tác với popup, nguồn gốc của tài nguyên được tải ban đầu trong cửa sổ popup được cấp quyền truy cập lưu trữ vào tài liệu opener nếu nguồn gốc đó đã nhận được tương tác của người dùng như một bên đầu tiên trong 30 ngày qua.

Quyền truy cập lưu trữ bên thứ ba cũng có thể được cấp khi người dùng điều hướng đến nguồn gốc khác trong cùng một cửa sổ. Nếu người dùng tương tác với nguồn gốc đó, sau đó nhanh chóng điều hướng đến một tài liệu trong nguồn gốc ban đầu, trang trung gian được cấp quyền truy cập lưu trữ vào tài liệu cuối đó.

### Phạm vi truy cập lưu trữ

Khi quyền truy cập lưu trữ được cấp, nó được phân tầm đến trang web của tài liệu opener hoặc các tên miền con của nguồn gốc đó. Quyền truy cập được cấp trên tên miền con của một nguồn gốc sẽ mở rộng đến nguồn gốc cấp cao nhất. Ví dụ, nếu một tài nguyên từ `tracker.example` được cấp quyền truy cập lưu trữ trên `foo.example.com`, thì `tracker.example` sẽ có thể truy cập cookie của nó trên `bar.foo.example.com` và trên `example.com`.

Khi quyền truy cập lưu trữ được cấp cho `tracker.example` trên `example.com`, tất cả các tài nguyên được tải từ `tracker.example` trên bất kỳ tài liệu cấp cao nhất nào được tải từ `example.com` ngay lập tức được cấp quyền truy cập lưu trữ. Điều này bao gồm tất cả các tài nguyên được tải trong ngữ cảnh chính của trang, các `<iframe>` nhúng, và các tài nguyên được tải trong các `<iframe>` nhúng. Quyền truy cập lưu trữ không được mở rộng cho các tài nguyên khác được tải trên `example.com` (ví dụ: `other-tracker.example`), cũng không mở rộng đến các bên đầu tiên khác mà `tracker.example` được nhúng (ví dụ: `example.org`).

Các cấp phép truy cập lưu trữ mở rộng vào cấp đầu tiên của các ngữ cảnh lồng nhau, nhưng không xa hơn. Điều này có nghĩa là các `<iframe>` nhúng trong ngữ cảnh chính của trang và được tải từ một tên miền được phân loại là trình theo dõi sẽ có quyền truy cập đầy đủ vào tất cả các vị trí lưu trữ có thể truy cập qua JavaScript. Tương tự, các yêu cầu đối với tài nguyên được tải trong các `<iframe>` nhúng trong ngữ cảnh chính của trang sẽ có quyền truy cập vào các cookie HTTP. Tuy nhiên, các ngữ cảnh lồng nhau sâu hơn, bao gồm nhưng không giới hạn ở những ngữ cảnh từ nguồn gốc được phân loại là trình theo dõi, sẽ không được cấp quyền truy cập lưu trữ.

Xem xét các kịch bản nhúng sau trên một trang cấp cao nhất được tải từ `example.com` mà `tracker.example` đã được cấp quyền truy cập lưu trữ.

| Nhúng                                                                                                                                 | Quyền truy cập lưu trữ tài nguyên tracker.example |
| ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| Một hình ảnh được tải từ `tracker.example` và nhúng trong ngữ cảnh chính của `example.com`.                                           | HTTP: Có JS: Không áp dụng                        |
| `example.com` nhúng một `<iframe>` từ `example.org`. `<iframe>` đó tiếp tục tải một hình ảnh từ `tracker.example`.                    | HTTP: Có JS: Không áp dụng                        |
| `example.com` nhúng một `<iframe>` từ `example.org`. `<iframe>` đó tiếp tục nhúng một `<iframe>` từ `tracker.example`.                | HTTP: Có JS: Không                                |
| `example.com` nhúng một `<iframe>` từ `tracker.example`.                                                                              | HTTP: Có JS: Có                                   |
| `example.com` nhúng một `<iframe>` từ `example.com` (cùng nguồn gốc). `<iframe>` lồng nhau nhúng một `<iframe>` từ `tracker.example`. | HTTP: Có JS: Không                                |

### Hết hạn quyền truy cập lưu trữ

Cấp phép truy cập lưu trữ hết hạn sau 30 ngày. Các tên miền được phân loại là tài nguyên theo dõi có thể được cấp quyền truy cập lưu trữ bên thứ ba trên nhiều bên đầu tiên, và quyền lưu trữ cho mỗi bên hết hạn độc lập. Các heuristic ở trên cũng sẽ phục vụ để mở rộng thời gian sống của quyền lưu trữ bên thứ ba trên các nguồn gốc đã được cấp quyền truy cập. Mỗi lần heuristic được kích hoạt, hoặc một cuộc gọi thành công đến Storage Access API được thực hiện, hạn hết hạn truy cập lưu trữ hiện có sẽ được mở rộng thêm 30 ngày, tính từ thời điểm quyền truy cập trước đó được cấp.

Xin lưu ý rằng trong tương lai chúng tôi mong đợi thực hiện các thay đổi về thời gian truy cập lưu trữ sẽ vẫn còn hiệu lực. Như đã đề cập trước đó, cách để biết rằng bạn sẽ có thể sử dụng lưu trữ như một bên thứ ba sắp tới là sử dụng Storage Access API.

## Gỡ lỗi

Chúng tôi khuyến khích chủ sở hữu trang web kiểm tra trang web của họ, đặc biệt là những trang dựa vào tích hợp nội dung bên thứ ba. Chúng tôi đã thêm một số tính năng mới vào Firefox để giúp kiểm tra dễ dàng hơn.

### Thông báo của Developer Tools

[Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) trong Firefox Developer Tools bây giờ bao gồm một chỉ báo cho tất cả các yêu cầu tài nguyên đã được phân loại là tài nguyên theo dõi. Chỉ báo này được hiển thị dưới dạng biểu tượng khiên trong cột tên miền. Trong hình ảnh mẫu bên dưới, `trackertest.org` được phân loại là tài nguyên theo dõi, trong khi yêu cầu đến example.com thì không.

![Yêu cầu mạng trong Firefox DevTools chỉ ra yêu cầu nào là tài nguyên theo dõi bằng biểu tượng khiên nhỏ](network-requests.png)

### Thêm tên miền tùy chỉnh vào danh sách Bảo vệ Theo dõi

Tò mò về cách hoạt động nếu một tên miền bên thứ ba trên trang web của bạn được phân loại là trình theo dõi? Chúng tôi đã thêm một tùy chọn cho phép bạn thêm tên miền tùy chỉnh vào bộ phân loại URL Bảo vệ Theo dõi. Để làm vậy:

1. Nhập `about:config` vào thanh địa chỉ của bạn. Nếu bạn được hiển thị một trang cảnh báo "This may void your warranty!", hãy nhấp "I accept the risk!"
2. Tìm kiếm tên tùy chọn "urlclassifier.trackingAnnotationTable.testEntries".
3. Nếu tùy chọn đã tồn tại, hãy chỉnh sửa giá trị tùy chọn.
4. Nếu tùy chọn không tồn tại, hãy nhấp "String" và sau đó "+" để tạo tùy chọn mới.
5. Đối với giá trị tùy chọn, nhập các nguồn gốc phân tách bằng dấu phẩy mà bạn muốn phân loại là trình theo dõi. Ví dụ: "example.net,example.org".

> [!WARNING]
> Hãy đảm bảo xóa các mục này sau khi bạn đã hoàn thành kiểm tra.

## Câu hỏi thường gặp

Chính sách cookie này có khả năng dẫn đến sự cố trang web, nhưng đã được thiết kế để cho phép các tích hợp bên thứ ba phổ biến tiếp tục hoạt động trong khi ngăn chặn theo dõi cross-site. Trong phần này, chúng tôi mô tả chức năng bạn có thể mong đợi trong các kịch bản tích hợp khác nhau.

### Chính sách truy cập lưu trữ này có chặn quảng cáo hiển thị trên trang web của tôi không?

Không — tính năng này chỉ hạn chế quyền truy cập vào cookie và dữ liệu trang web có thể được sử dụng để theo dõi người dùng trên các trang web. Việc chặn các định danh theo dõi không ngăn việc hiển thị quảng cáo.

### Tôi sử dụng dịch vụ phân tích bên thứ ba được phân loại là trình theo dõi. Tôi có còn nhận được dữ liệu phân tích không?

Điều này phụ thuộc vào cách dịch vụ phân tích bên thứ ba được triển khai. Các nhà cung cấp phân tích bên thứ ba sẽ không còn có thể sử dụng lưu trữ bên thứ ba của họ để thu thập dữ liệu. Điều này có nghĩa là các nhà cung cấp sử dụng cookie được phân tầm đến tên miền bên thứ ba của họ, hoặc lưu trữ cục bộ và dữ liệu trang web khác được lưu trữ dưới nguồn gốc của họ, sẽ không còn có quyền truy cập vào các định danh đó trên các trang web khác.

Nếu các dịch vụ này được nhúng vào ngữ cảnh chính của trang, chúng có thể tiếp tục sử dụng cookie bên đầu tiên và lưu trữ trang web để theo dõi người dùng qua các lần truy cập trang trên tên miền bên đầu tiên cụ thể đó.

### Tôi sử dụng dịch vụ bên thứ ba cho đăng nhập xã hội, nút thích và chia sẻ. Người dùng của tôi có còn có thể sử dụng các dịch vụ này không?

Điều này phụ thuộc vào cách tích hợp xã hội được triển khai. Chúng tôi mong đợi rằng nhiều tích hợp xã hội phổ biến sẽ tiếp tục hoạt động như chúng làm dưới chính sách cookie hiện tại của Firefox với một số khác biệt nhỏ trong trải nghiệm người dùng.

Một nhà cung cấp nội dung xã hội được phân loại là trình theo dõi sẽ không có quyền truy cập vào cookie bên thứ ba của họ khi người dùng lần đầu truy cập một bên đầu tiên mới. Do đó, người dùng có thể bị hiển thị là đã đăng xuất với dịch vụ mặc dù đã đăng nhập khi họ truy cập trang web của nhà cung cấp trực tiếp. Tùy thuộc vào loại tích hợp, người dùng có thể phải thực hiện một số hành động để tương tác với nhà cung cấp nội dung xã hội trước khi nhà cung cấp được cấp quyền truy cập vào cookie của họ. Ví dụ:

- Đối với đăng nhập xã hội, người dùng có thể phải nhấp vào nút đăng nhập trên bên đầu tiên.
- Đối với các nút thích hoặc chia sẻ xã hội, người dùng sẽ phải tương tác với nút trước ở trạng thái đã đăng xuất. Sau khi làm điều đó, nhiều nhà cung cấp nội dung xã hội sẽ nhắc họ đăng nhập.

Sau các tương tác này, nhà cung cấp sẽ nhận được quyền truy cập lưu trữ bên thứ ba nếu họ nhắc người dùng theo cách được nắm bắt bởi heuristic kích hoạt truy cập lưu trữ được mô tả ở trên. Các nhà cung cấp này nên cân nhắc chuyển sang yêu cầu quyền truy cập lưu trữ rõ ràng qua Storage Access API càng sớm càng tốt.

### Tôi sử dụng pixel bên thứ ba và các công cụ khác để đo lường hiệu quả của các chiến dịch quảng cáo. Tôi có còn có thể đo lường tỷ lệ chuyển đổi quảng cáo của mình không?

Điều này phụ thuộc vào cách bên thứ ba đã triển khai công cụ đo lường, nhưng nói chung đo lường chuyển đổi quảng cáo sẽ khó khăn hơn. Hãy xem xét các ví dụ sau:

1. Bạn chạy một quảng cáo trên một trang mạng xã hội được một người dùng xem nhiều lần, nhưng không bao giờ được nhấp. Người dùng đó sau đó truy cập trang web của bạn, bao gồm thẻ theo dõi chuyển đổi từ cùng trang mạng xã hội. Loại chuyển đổi này thường được gọi là "chuyển đổi view-through". Vì trang mạng xã hội không có quyền truy cập vào lưu trữ bên thứ ba của họ, họ sẽ không nhận ra người dùng là cùng người đã xem quảng cáo trên trang web của họ và chuyển đổi sẽ không được theo dõi. Chúng tôi mong đợi rằng hầu hết các kỹ thuật theo dõi chuyển đổi view-through sẽ không còn hoạt động, bao gồm những kỹ thuật do các mạng hiển thị cung cấp.
2. Bạn chạy một quảng cáo trên mạng hiển thị hoặc trang mạng xã hội được người dùng nhấp vào. Người dùng đó đến trang web của bạn, bao gồm thẻ theo dõi chuyển đổi từ cùng trang web hiển thị quảng cáo của bạn. Loại chuyển đổi này thường được gọi là "chuyển đổi click-through". Vì trang mạng xã hội hoặc mạng hiển thị sẽ không có quyền truy cập vào lưu trữ bên thứ ba của họ, họ sẽ không nhận ra người dùng là cùng người đã xem quảng cáo trên trang web của họ và chuyển đổi sẽ không được theo dõi. Chúng tôi mong đợi rằng phiên bản này của chuyển đổi click-through sẽ không còn hoạt động.
3. Bạn chạy một quảng cáo xuất hiện trên trang mạng xã hội. Một người dùng nhấp vào quảng cáo của bạn và được đưa đến trang đích chứa thẻ theo dõi chuyển đổi từ mạng bên thứ ba. Trên trang mạng xã hội, mạng chú thích URL trang đích quảng cáo với tham số truy vấn báo hiệu rằng lần truy cập là kết quả của việc nhấp vào quảng cáo. Trên trang web của bạn, thẻ của mạng hiển thị kiểm tra tham số truy vấn URL và lưu bất kỳ tham số theo dõi quảng cáo nào vào lưu trữ bên đầu tiên. Nếu người dùng sau đó hoàn thành một sự kiện chuyển đổi, thẻ của mạng kiểm tra lưu trữ bên đầu tiên để xác định nhấp chuột nào (hoặc các nhấp chuột nào) chịu trách nhiệm cho lần truy cập. Chúng tôi mong đợi rằng chuyển đổi click-through được triển khai theo cách này sẽ tiếp tục hoạt động.
