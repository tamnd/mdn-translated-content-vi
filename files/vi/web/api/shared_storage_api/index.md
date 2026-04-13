---
title: Shared Storage API
slug: Web/API/Shared_Storage_API
page-type: web-api-overview
status:
  - deprecated
browser-compat: api.SharedStorage
---

{{DefaultAPISidebar("Shared Storage API")}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang bị một nhà cung cấp trình duyệt phản đối.
> Xem phần [Standards positions](#standards_positions) bên dưới để biết chi tiết.

**Shared Storage API** là cơ chế lưu trữ phía client cho phép truy cập dữ liệu chéo trang không phân vùng trong khi bảo vệ quyền riêng tư (tức là không dựa vào cookie theo dõi).

## Khái niệm và cách sử dụng

Một nguồn gốc chính của các vấn đề [quyền riêng tư](/en-US/docs/Web/Privacy) và [bảo mật](/en-US/docs/Web/Security) trên web là việc sử dụng cookie được đặt trên nội dung của bên thứ ba được nhúng vào các trang web (ví dụ qua các phần tử {{htmlelement("iframe")}}). Các cookie này có thể được dùng để theo dõi và lập hồ sơ người dùng, và chia sẻ thông tin giữa các trang web.

Để ngăn chặn theo dõi chéo trang, các trình duyệt đang hướng đến việc phân vùng tất cả các loại lưu trữ. Tuy nhiên, một rào cản lớn để đạt được điều này là nhu cầu cho một số trường hợp sử dụng hợp pháp dựa vào chia sẻ thông tin chéo trang.

Shared Storage API cung cấp giải pháp linh hoạt cho các trường hợp sử dụng như vậy, nhằm cung cấp khả năng lưu trữ, xử lý và chia sẻ dữ liệu cần thiết mà không có khả năng theo dõi và lập hồ sơ người dùng.

Giống như các API lưu trữ khác, bạn có thể ghi vào shared storage bất cứ lúc nào. Tuy nhiên, bạn chỉ có thể đọc dữ liệu shared storage từ bên trong một {{domxref("SharedStorageWorklet", "worklet", "", "nocode")}}. Worklet cung cấp môi trường bảo mật bên trong bạn có thể xử lý dữ liệu shared storage và trả về kết quả hữu ích, nhưng bạn không thể chia sẻ trực tiếp dữ liệu với ngữ cảnh duyệt web liên quan.

Để trích xuất kết quả hữu ích từ shared storage worklet, bạn cần sử dụng **output gate**. Các gate này phục vụ các mục đích cụ thể như chọn URL từ danh sách được cung cấp để hiển thị cho người dùng dựa trên dữ liệu shared storage.

## Output gates

Các output gate hiện có khả dụng cho Shared Storage API được thảo luận trong các phần bên dưới.

> [!NOTE]
> Nhiều output gate hơn có thể sẽ được thêm vào trong tương lai để hỗ trợ các trường hợp sử dụng bổ sung.

### URL Selection

Output gate **URL Selection**, được truy cập qua phương thức {{domxref("WindowSharedStorage.selectURL", "selectURL()")}}, được dùng để chọn URL từ danh sách được cung cấp để hiển thị cho người dùng, dựa trên dữ liệu shared storage.

### Run

Output gate **Run**, được truy cập qua phương thức {{domxref("WindowSharedStorage.run", "run()")}}, được thiết kế để sử dụng theo cách chung để xử lý một số dữ liệu shared storage.

## Hiểu cách hoạt động của shared storage

Có hai phần khi sử dụng Shared Storage API: ghi dữ liệu vào lưu trữ và đọc/xử lý nó.

### Ghi vào shared storage

Ghi dữ liệu vào shared storage rất đơn giản. Bạn sử dụng các phương thức được định nghĩa trên giao diện {{domxref("SharedStorage")}} để {{domxref("SharedStorage.set", "set", "", "nocode")}}, {{domxref("SharedStorage.append", "append", "", "nocode")}}, hoặc {{domxref("SharedStorage.delete", "delete", "", "nocode")}}/{{domxref("SharedStorage.clear", "clear", "", "nocode")}} dữ liệu.

### Đọc và xử lý dữ liệu từ shared storage

Để trích xuất kết quả hữu ích từ shared storage worklet, bạn cần sử dụng **output gate**.

## Sự khác biệt giữa shared storage và web storage

Sự khác biệt chính là shared storage được thiết kế để sử dụng với dữ liệu chéo nguồn gốc sau khi lưu trữ đã được phân vùng.

- Nếu bạn là nhà xuất bản và muốn lưu dữ liệu bên thứ nhất chỉ có thể truy cập bởi bạn, hãy sử dụng phiên bản [`localStorage`](/en-US/docs/Web/API/Window/localStorage) của [web storage](/en-US/docs/Web/API/Web_Storage_API).
- Nếu bạn muốn dữ liệu chỉ tồn tại trong phiên trình duyệt, hãy sử dụng [`sessionStorage`](/en-US/docs/Web/API/Window/sessionStorage).
- Nếu bạn đang hoạt động như bên thứ ba trên trang web khác và muốn ghi lại dữ liệu từ trang đó để truy cập sau trên trang khác, hãy sử dụng shared storage.

## Giao diện

- {{domxref("SharedStorage")}}
  - : Đại diện cho shared storage của một nguồn gốc cụ thể. Xác định các phương thức để ghi dữ liệu vào shared storage.
- {{domxref("WindowSharedStorage")}}
  - : Đại diện cho shared storage của một nguồn gốc cụ thể như được hiển thị cho ngữ cảnh duyệt web tiêu chuẩn.
- {{domxref("WorkletSharedStorage")}}
  - : Đại diện cho shared storage của một nguồn gốc cụ thể trong ngữ cảnh worklet.
- {{domxref("SharedStorageWorklet")}}
  - : Đại diện cho shared storage worklet của nguồn gốc hiện tại.
- {{domxref("SharedStorageWorkletGlobalScope")}}
  - : Đại diện cho phạm vi toàn cục của module {{domxref("SharedStorageWorklet")}}.

### Định nghĩa chữ ký thao tác output gate

- {{domxref("SharedStorageOperation")}}
  - : Đại diện cho lớp cơ sở cho tất cả các loại thao tác output gate khác nhau.
- {{domxref("SharedStorageRunOperation")}}
  - : Đại diện cho thao tác Run output gate.
- {{domxref("SharedStorageSelectURLOperation")}}
  - : Đại diện cho thao tác URL Selection output gate.

### Mở rộng các giao diện khác

- {{domxref("Window.sharedStorage")}}
  - : Trả về đối tượng {{domxref("WindowSharedStorage")}} cho nguồn gốc hiện tại.

## Đăng ký và kiểm tra cục bộ

Để sử dụng Shared Storage API trên các trang web của bạn, bạn phải chỉ định nó trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment).

## Ví dụ

Để biết các demo mở rộng, xem [trang web demo Shared Storage API](https://shared-storage-demo.web.app/).

## Thông số kỹ thuật

{{Specifications}}

### Standards positions

Một nhà cung cấp trình duyệt [phản đối](/en-US/docs/Glossary/Web_standards#opposing_standards) đặc tả này.
Các vị thế tiêu chuẩn đã biết như sau:

- Mozilla (Firefox): [Negative](https://github.com/mozilla/standards-positions/issues/646)

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage](https://privacysandbox.google.com/private-advertising/shared-storage) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
