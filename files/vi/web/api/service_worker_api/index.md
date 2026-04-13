---
title: Service Worker API
slug: Web/API/Service_Worker_API
page-type: web-api-overview
spec-urls: https://w3c.github.io/ServiceWorker/
---

{{DefaultAPISidebar("Service Workers API")}}{{AvailableInWorkers}}

Service worker về cơ bản hoạt động như các máy chủ proxy nằm giữa ứng dụng web, trình duyệt và mạng (khi có sẵn). Mục đích của chúng, trong số những thứ khác, là cho phép tạo ra trải nghiệm ngoại tuyến hiệu quả, chặn các yêu cầu mạng, thực hiện hành động phù hợp dựa trên việc mạng có khả dụng hay không, và cập nhật các tài nguyên đang nằm trên máy chủ. Chúng cũng sẽ cho phép truy cập vào thông báo đẩy và các API đồng bộ nền.

> [!NOTE]
> Service worker là một loại web worker. Xem [Web workers](/en-US/docs/Web/API/Web_Workers_API) để biết thông tin tổng quan về các loại worker và các trường hợp sử dụng.

## Khái niệm và cách dùng service worker

Service worker là một [worker](/en-US/docs/Web/API/Worker) điều khiển bởi sự kiện, được đăng ký theo một origin và một đường dẫn. Nó có dạng một tệp JavaScript có thể điều khiển trang web/site mà nó liên kết, chặn và chỉnh sửa các yêu cầu điều hướng và tài nguyên, đồng thời lưu đệm tài nguyên theo cách rất chi tiết để bạn có toàn quyền kiểm soát cách ứng dụng của mình hoạt động trong một số tình huống nhất định (rõ ràng nhất là khi mạng không khả dụng).

Service worker chạy trong ngữ cảnh worker: vì vậy chúng không có quyền truy cập DOM và chạy trên một luồng khác với JavaScript chính đang vận hành ứng dụng của bạn. Chúng không chặn và được thiết kế để hoàn toàn bất đồng bộ. Do đó, các API đồng bộ như [XHR](/en-US/docs/Web/API/XMLHttpRequest) và [Web Storage](/en-US/docs/Web/API/Web_Storage_API) không thể được dùng bên trong service worker.

Service worker không thể nhập động các mô-đun JavaScript, và [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) sẽ ném lỗi nếu được gọi trong global scope của service worker. Các lệnh import tĩnh bằng câu lệnh [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) vẫn được cho phép.

Service worker chỉ khả dụng trong [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts): điều này có nghĩa là tài liệu của chúng được phục vụ qua HTTPS, mặc dù trình duyệt cũng coi `http://localhost` là một secure context để thuận tiện cho phát triển cục bộ. Kết nối HTTP dễ bị các cuộc tấn công chèn mã độc bởi tấn công {{Glossary("MitM", "man in the middle")}}, và những cuộc tấn công như vậy sẽ còn tệ hơn nếu được phép truy cập các API mạnh mẽ này.

> [!NOTE]
> Trên Firefox, để thử nghiệm, bạn có thể chạy service worker qua HTTP (không an toàn); chỉ cần chọn tùy chọn **Enable Service Workers over HTTP (when toolbox is open)** trong menu tùy chọn/biểu tượng bánh răng của Firefox DevTools.

> [!NOTE]
> Không giống như các nỗ lực trước đây trong lĩnh vực này như [AppCache](https://alistapart.com/article/application-cache-is-a-douchebag/), service worker không đưa ra giả định về điều bạn đang cố làm rồi sau đó vỡ khi các giả định đó không chính xác. Thay vào đó, service worker cho bạn quyền kiểm soát chi tiết hơn rất nhiều.

> [!NOTE]
> Service worker sử dụng rất nhiều [promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise), vì nhìn chung chúng sẽ chờ phản hồi đi qua, rồi sau đó trả lời bằng một hành động thành công hoặc thất bại. Kiến trúc promise rất phù hợp cho việc này.

### Đăng ký

Service worker đầu tiên được đăng ký bằng phương thức {{DOMxRef("ServiceWorkerContainer.register()")}}. Nếu thành công, service worker của bạn sẽ được tải xuống client và thử cài đặt/kích hoạt (xem bên dưới) cho các URL mà người dùng truy cập trong toàn bộ origin, hoặc một tập con do bạn chỉ định.

### Tải xuống, cài đặt và kích hoạt

Tại thời điểm này, service worker của bạn sẽ trải qua vòng đời sau:

1. Tải xuống
2. Cài đặt
3. Kích hoạt

Service worker được tải xuống ngay lập tức khi người dùng lần đầu truy cập một trang/site được service worker điều khiển.

Sau đó, nó sẽ được cập nhật khi:

- Có điều hướng tới một trang nằm trong phạm vi.
- Một sự kiện được phát ra trên service worker và nó chưa được tải xuống trong 24 giờ gần nhất.

Việc cài đặt được thử khi tệp đã tải xuống được cho là mới - tức là khác với một service worker hiện có (so sánh theo từng byte), hoặc là service worker đầu tiên được gặp cho trang/site này.

Nếu đây là lần đầu tiên service worker được cung cấp, quá trình cài đặt sẽ được thử, rồi sau khi cài đặt thành công, nó sẽ được kích hoạt.

Nếu đã có một service worker hiện có, phiên bản mới sẽ được cài đặt trong nền, nhưng chưa được kích hoạt - tại thời điểm này nó được gọi là _worker đang chờ_. Nó chỉ được kích hoạt khi không còn trang nào đang mở vẫn sử dụng service worker cũ. Ngay khi không còn trang nào cần được tải nữa, service worker mới sẽ kích hoạt (trở thành _worker đang hoạt động_). Việc kích hoạt có thể diễn ra sớm hơn bằng {{DOMxRef("ServiceWorkerGlobalScope.skipWaiting()")}}, và các trang hiện có có thể được worker đang hoạt động chiếm quyền bằng {{DOMxRef("Clients.claim()")}}.

Bạn có thể lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope/install_event", "install")}}; một hành động tiêu chuẩn là chuẩn bị service worker cho việc sử dụng khi sự kiện này được phát, chẳng hạn bằng cách tạo một cache bằng API lưu trữ tích hợp sẵn và đặt vào đó các tài nguyên bạn muốn dùng khi ứng dụng chạy ngoại tuyến.

Cũng có sự kiện {{domxref("ServiceWorkerGlobalScope/activate_event", "activate")}}. Thời điểm sự kiện này được phát thường là lúc thích hợp để dọn dẹp các cache cũ và những thứ khác gắn với phiên bản service worker trước đó.

Service worker của bạn có thể phản hồi các yêu cầu bằng sự kiện {{DOMxRef("FetchEvent")}}. Bạn có thể sửa đổi phản hồi cho các yêu cầu này theo bất kỳ cách nào bạn muốn, bằng phương thức {{DOMxRef("FetchEvent.respondWith()")}}.

> [!NOTE]
> Vì các sự kiện `install`/`activate` có thể mất một lúc để hoàn tất, đặc tả service worker cung cấp phương thức {{domxref("ExtendableEvent.waitUntil", "waitUntil()")}}. Khi nó được gọi trên sự kiện `install` hoặc `activate` với một promise, các sự kiện chức năng như `fetch` và `push` sẽ chờ cho đến khi promise đó được giải quyết thành công.

Để có hướng dẫn đầy đủ về cách xây dựng ví dụ cơ bản đầu tiên của bạn, hãy đọc [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers).

### Sử dụng static routing để kiểm soát cách tài nguyên được tải

Service worker có thể tạo thêm chi phí hiệu năng không cần thiết - khi một trang được tải lần đầu sau một khoảng thời gian, trình duyệt phải chờ service worker khởi động và chạy để biết nội dung nào cần tải và liệu nó nên đến từ cache hay từ mạng.

Nếu bạn đã biết trước nơi một nội dung nhất định nên được lấy từ đâu, bạn có thể bỏ qua service worker hoàn toàn và tải tài nguyên ngay lập tức. Phương thức {{domxref("InstallEvent.addRoutes()")}} có thể được dùng để triển khai trường hợp sử dụng này và nhiều hơn nữa.

## Các ý tưởng trường hợp sử dụng khác

Service worker cũng được dự định dùng cho những việc như:

- Đồng bộ dữ liệu nền.
- Phản hồi các yêu cầu tài nguyên từ origin khác.
- Nhận các bản cập nhật tập trung cho dữ liệu đắt tiền khi tính toán như vị trí địa lý hoặc con quay hồi chuyển, để nhiều trang có thể dùng chung một bộ dữ liệu.
- Biên dịch phía client và quản lý phụ thuộc của CoffeeScript, less, CJS/AMD modules, v.v. cho mục đích phát triển.
- Hook cho các dịch vụ nền.
- Templating tùy chỉnh dựa trên các mẫu URL nhất định.
- Cải thiện hiệu năng, ví dụ như pre-fetch tài nguyên mà người dùng có khả năng sẽ cần sớm, chẳng hạn vài hình tiếp theo trong một album ảnh.
- Giả lập API.

Trong tương lai, service worker sẽ có thể làm thêm nhiều việc hữu ích khác cho nền tảng web để đưa nó đến gần hơn với khả năng sử dụng như ứng dụng gốc. Thú vị là, các đặc tả khác có thể và sẽ bắt đầu tận dụng ngữ cảnh service worker, ví dụ:

- [Background synchronization](https://github.com/WICG/background-sync): Khởi động service worker ngay cả khi không có người dùng nào ở trên site, để cache có thể được cập nhật, v.v.
- [Phản ứng với thông điệp đẩy](/en-US/docs/Web/API/Push_API): Khởi động service worker để gửi cho người dùng một thông báo cho biết có nội dung mới.
- Phản ứng với một thời điểm và ngày giờ cụ thể.
- Đi vào một geo-fence.

## Giao diện

- {{DOMxRef("Cache")}}
  - : Đại diện cho bộ nhớ lưu trữ các cặp đối tượng {{DOMxRef("Request")}} / {{DOMxRef("Response")}} được lưu đệm như một phần của vòng đời {{DOMxRef("ServiceWorker")}}.
- {{DOMxRef("CacheStorage")}}
  - : Đại diện cho bộ nhớ lưu trữ các đối tượng {{DOMxRef("Cache")}}. Nó cung cấp một thư mục chính của tất cả các cache có tên mà một {{DOMxRef("ServiceWorker")}} có thể truy cập, và duy trì ánh xạ từ tên chuỗi sang các đối tượng {{DOMxRef("Cache")}} tương ứng.
- {{DOMxRef("Client")}}
  - : Đại diện cho phạm vi của một client service worker. Client service worker là một tài liệu trong ngữ cảnh trình duyệt hoặc một {{DOMxRef("SharedWorker")}}, được điều khiển bởi một worker đang hoạt động.
- {{DOMxRef("Clients")}}
  - : Đại diện cho một container chứa danh sách các đối tượng {{DOMxRef("Client")}}; cách chính để truy cập các client service worker đang hoạt động ở origin hiện tại.
- {{DOMxRef("ExtendableEvent")}}
  - : Kéo dài vòng đời của các sự kiện `install` và `activate` được phát trên {{DOMxRef("ServiceWorkerGlobalScope")}}, như một phần của vòng đời service worker. Điều này đảm bảo rằng các sự kiện chức năng (như {{DOMxRef("FetchEvent")}}) sẽ không được phát tới {{DOMxRef("ServiceWorker")}} cho đến khi nó nâng cấp lược đồ cơ sở dữ liệu và xóa các mục cache lỗi thời, v.v.
- {{DOMxRef("ExtendableMessageEvent")}}
  - : Đối tượng sự kiện của một sự kiện {{domxref("ServiceWorkerGlobalScope/message_event", "message")}} được phát trên service worker (khi một message từ channel được nhận trên {{DOMxRef("ServiceWorkerGlobalScope")}} từ ngữ cảnh khác) - kéo dài vòng đời của những sự kiện này.
- {{DOMxRef("FetchEvent")}}
  - : Tham số được truyền vào trình xử lý {{DOMxRef("ServiceWorkerGlobalScope.fetch_event", "onfetch")}}, `FetchEvent` đại diện cho một hành động fetch được phát trên {{DOMxRef("ServiceWorkerGlobalScope")}} của một {{DOMxRef("ServiceWorker")}}. Nó chứa thông tin về request và phản hồi thu được, đồng thời cung cấp phương thức {{DOMxRef("FetchEvent.respondWith", "FetchEvent.respondWith()")}}, cho phép chúng ta cung cấp một phản hồi tùy ý trở lại trang được điều khiển.
- {{DOMxRef("InstallEvent")}}
  - : Tham số được truyền vào hàm xử lý sự kiện {{DOMxRef("ServiceWorkerGlobalScope.install_event", "install")}}, giao diện `InstallEvent` đại diện cho một hành động cài đặt được phát trên {{DOMxRef("ServiceWorkerGlobalScope")}} của một {{DOMxRef("ServiceWorker")}}. Là một phần con của {{DOMxRef("ExtendableEvent")}}, nó đảm bảo rằng các sự kiện chức năng như {{DOMxRef("FetchEvent")}} sẽ không được phát trong quá trình cài đặt.
- {{DOMxRef("NavigationPreloadManager")}}
  - : Cung cấp các phương thức để quản lý việc tải trước tài nguyên với service worker.
- {{DOMxRef("ServiceWorker")}}
  - : Đại diện cho một service worker. Nhiều ngữ cảnh duyệt web (ví dụ: trang, worker, v.v.) có thể được gắn với cùng một đối tượng `ServiceWorker`.
- {{DOMxRef("ServiceWorkerContainer")}}
  - : Cung cấp một đối tượng đại diện cho service worker như một đơn vị tổng thể trong hệ sinh thái mạng, bao gồm các tiện ích để đăng ký, hủy đăng ký và cập nhật service worker, cũng như truy cập trạng thái của service worker và các đăng ký của chúng.
- {{DOMxRef("ServiceWorkerGlobalScope")}}
  - : Đại diện cho ngữ cảnh thực thi toàn cục của một service worker.
- {{DOMxRef("ServiceWorkerRegistration")}}
  - : Đại diện cho một đăng ký service worker.
- {{DOMxRef("WindowClient")}}
  - : Đại diện cho phạm vi của một client service worker là một tài liệu trong ngữ cảnh trình duyệt, được điều khiển bởi một worker đang hoạt động. Đây là một kiểu đặc biệt của đối tượng {{DOMxRef("Client")}}, với một số phương thức và thuộc tính bổ sung có sẵn.

### Các phần mở rộng cho giao diện khác

- {{DOMxRef("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
  - : Trả về đối tượng {{domxref("CacheStorage")}} được gắn với ngữ cảnh hiện tại.
- {{DOMxRef("Navigator.serviceWorker")}} và {{domxref("WorkerNavigator.serviceWorker")}}
  - : Trả về một đối tượng {{DOMxRef("ServiceWorkerContainer")}}, cung cấp quyền truy cập vào việc đăng ký, gỡ bỏ, nâng cấp và giao tiếp với các đối tượng {{DOMxRef("ServiceWorker")}} cho [tài liệu được liên kết](https://html.spec.whatwg.org/multipage/browsers.html#concept-document-window).

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service Worker Lifecycle](https://web.dev/articles/service-worker-lifecycle)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- Các Web API liên quan đến Service Worker API:
  - {{domxref("Background Fetch API", "", "", "nocode")}}
  - {{domxref("Background Synchronization API", "", "", "nocode")}}
  - {{domxref("Content Index API", "", "", "nocode")}}
  - {{domxref("Cookie Store API", "", "", "nocode")}}
  - {{domxref("Notifications API", "", "", "nocode")}}
  - {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
  - {{domxref("Push API", "", "", "nocode")}}
  - {{domxref("Web Periodic Background Synchronization API", "", "", "nocode")}}
