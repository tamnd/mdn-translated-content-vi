---
title: Storage quotas and eviction criteria
slug: Web/API/Storage_API/Storage_quotas_and_eviction_criteria
page-type: guide
---

{{DefaultAPISidebar("Storage")}}

Các nhà phát triển web có thể sử dụng một số công nghệ để lưu trữ dữ liệu trong trình duyệt của người dùng (tức là trên đĩa cục bộ của thiết bị người dùng đang sử dụng để xem trang web).

Lượng dữ liệu trình duyệt cho phép trang web lưu trữ và các cơ chế chúng sử dụng để xóa dữ liệu khi đạt đến giới hạn đó khác nhau giữa các trình duyệt.

Bài viết này mô tả các công nghệ web có thể được dùng để lưu trữ dữ liệu, các quota mà trình duyệt đặt ra để giới hạn trang web lưu trữ quá nhiều dữ liệu, và các cơ chế chúng dùng để xóa dữ liệu khi cần.

## Làm thế nào trình duyệt tách dữ liệu từ các trang web khác nhau?

Trình duyệt lưu trữ dữ liệu từ các trang web ở các vị trí khác nhau, còn gọi là buckets, để giảm nguy cơ người dùng bị theo dõi trên web. Trong hầu hết các trường hợp, trình duyệt quản lý dữ liệu được lưu trữ _theo origin_.

Thuật ngữ _{{Glossary("origin")}}_ rất quan trọng để hiểu bài viết này. Một origin được định nghĩa bởi scheme (như HTTPS), hostname, và port. Ví dụ, `https://example.com` và `https://example.com/app/index.html` thuộc cùng một origin vì chúng có cùng scheme (`https`), hostname (`example.com`), và port mặc định.

Các quota và tiêu chí thu hồi được mô tả trong bài viết này áp dụng cho toàn bộ origin, ngay cả khi origin này được dùng để chạy nhiều trang web, chẳng hạn như `https://example.com/site1/` và `https://example.com/site2/`.

## Các công nghệ lưu dữ liệu trong trình duyệt?

Nhà phát triển web có thể sử dụng các công nghệ web sau để lưu trữ dữ liệu trong trình duyệt:

| Công nghệ                                                                                           | Mô tả                                                                                                                                                                                                                     |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Cookies](/en-US/docs/Web/HTTP/Guides/Cookies)                                                      | Cookie HTTP là một mảnh dữ liệu nhỏ mà web server và trình duyệt gửi cho nhau để nhớ thông tin trạng thái qua các điều hướng trang.                                                                                       |
| [Web Storage](/en-US/docs/Web/API/Web_Storage_API)                                                  | Web Storage API cung cấp cơ chế cho các trang web để lưu trữ cặp key/value chỉ chuỗi, bao gồm [`localStorage`](/en-US/docs/Web/API/Window/localStorage) và [`sessionStorage`](/en-US/docs/Web/API/Window/sessionStorage). |
| [IndexedDB](/en-US/docs/Web/API/IndexedDB_API)                                                      | IndexedDB là một Web API để lưu trữ các cấu trúc dữ liệu lớn trong trình duyệt và lập chỉ mục chúng để tìm kiếm hiệu suất cao.                                                                                            |
| [Cache API](/en-US/docs/Web/API/Cache)                                                              | Cache API cung cấp cơ chế lưu trữ persistent cho các cặp đối tượng yêu cầu và phản hồi HTTP được dùng để tải trang web nhanh hơn.                                                                                         |
| [Origin Private File System (OPFS)](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) | OPFS cung cấp hệ thống tệp riêng cho origin của trang và có thể được dùng để đọc và ghi thư mục và tệp.                                                                                                                   |

## Dữ liệu được lưu trữ trong trình duyệt có tồn tại lâu không?

Dữ liệu cho một origin có thể được lưu trữ theo hai cách trong trình duyệt, _persistent_ và _best-effort_:

- Best-effort: đây là cách dữ liệu được lưu trữ theo mặc định. Dữ liệu best-effort tồn tại miễn là origin ở dưới quota của nó, thiết bị có đủ dung lượng lưu trữ, và người dùng không chọn xóa dữ liệu thông qua cài đặt trình duyệt.
- Persistent: một origin có thể chọn lưu trữ dữ liệu theo cách persistent. Dữ liệu được lưu trữ theo cách này chỉ bị thu hồi hoặc xóa nếu người dùng chọn, bằng cách dùng cài đặt trình duyệt.

Dữ liệu được lưu trữ trong trình duyệt bởi một origin là best-effort theo mặc định. Khi sử dụng các công nghệ web như IndexedDB hoặc Cache, dữ liệu được lưu trữ một cách minh bạch mà không yêu cầu sự cho phép của người dùng. Tương tự, khi trình duyệt cần thu hồi dữ liệu best-effort, nó làm vậy mà không làm gián đoạn người dùng.

## Có thể lưu trữ bao nhiêu dữ liệu?

### Web Storage

Web Storage, có thể được truy cập bằng cách dùng các thuộc tính {{domxref("Window.localStorage", "localStorage")}} và {{domxref("Window.sessionStorage", "sessionStorage")}} của đối tượng {{domxref("window")}}, bị giới hạn ở 10 MiB dữ liệu tối đa trên tất cả trình duyệt.

Trình duyệt có thể lưu trữ tối đa 5 MiB local storage, và 5 MiB session storage mỗi origin.

Khi đạt đến giới hạn này, trình duyệt ném ra ngoại lệ `QuotaExceededError` cần được xử lý bằng khối {{jsxref("Statements/try...catch","try...catch")}}.

## Khi nào dữ liệu bị thu hồi?

Thu hồi dữ liệu là quá trình user agent xóa dữ liệu được lưu trữ của origin. Điều này có thể xảy ra, ví dụ, khi thiết bị được dùng để lưu trữ dữ liệu đang gần hết dung lượng lưu trữ.

Khi xóa dữ liệu được lưu trữ bởi một origin, bucket của origin được xử lý như một thực thể duy nhất. Toàn bộ dữ liệu được lưu trữ bởi origin này sẽ bị xóa.

Nếu bucket được đánh dấu là `"persistent"`, nội dung sẽ không bị user agent xóa trừ khi bản thân origin dữ liệu hoặc người dùng cụ thể làm vậy.
