---
title: Using the Topics API
slug: Web/API/Topics_API/Using
page-type: web-api-overview
status:
  - deprecated
  - non-standard
---

{{DefaultAPISidebar("Topics API")}}{{deprecated_header}}{{non-standard_header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](/en-US/docs/Web/API/Topics_API#standards_positions) để biết chi tiết về sự phản đối.

> [!NOTE]
> Cần có [quy trình đăng ký](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) để sử dụng Topics API trong ứng dụng của bạn. Xem phần [Đăng ký](/en-US/docs/Web/API/Topics_API#enrollment) để biết chi tiết về các tính năng con nào bị giới hạn bởi đăng ký.

Trang này giải thích cách Topics API hoạt động và cách sử dụng nó để tạo giải pháp **quảng cáo dựa trên sở thích (IBA)**.

## Tổng quan cấp cao

Giả sử chúng ta có một nền tảng ad tech, `ad-tech1.example`, đang nhúng quảng cáo qua {{htmlelement("iframe")}} vào các trang web nhà xuất bản sau:

- `yoga.example`
- `knitting.example`
- `football.example`

Nếu nội dung `<iframe>` từ `ad-tech1.example` triển khai [tính năng kích hoạt Topics API](#what_api_features_enable_the_topics_api), khi mỗi trang được tải, trình duyệt sẽ:

1. Suy luận **các chủ đề sở thích** từ URL trang web. Các chủ đề được lấy từ [phân loại tiêu chuẩn](/en-US/docs/Web/API/Topics_API#what_topics_are_there); đối với các URL ví dụ trên, chúng sẽ là "Fitness", "Fibre & textile arts" và "Soccer".
2. **Đánh dấu các chủ đề như đã quan sát**, liên quan đến việc ghi lại một **mục lịch sử chủ đề** cho mỗi chủ đề trong kho lịch sử chủ đề riêng tư. Mỗi mục lịch sử chủ đề bao gồm thông tin sau:
   - ID tài liệu (tức là định danh cho trang hiện tại).
   - Dữ liệu đầu vào tính toán chủ đề (tức là tên máy chủ của trang).
   - Thời gian (kể từ Unix epoch) khi trang được quan sát lần đầu tiên.
   - Các miền nơi chủ đề được quan sát (được gọi là **các miền người gọi chủ đề**).

### Chọn các chủ đề sở thích để ảnh hưởng đến lựa chọn quảng cáo

> [!NOTE]
> Các triển khai trình duyệt khác nhau có thể chọn các chủ đề theo những cách khác nhau. Văn bản bên dưới dựa trên cách Chrome hiện tại chọn chủ đề, cho mục đích minh họa.

Liên tục, trình duyệt sẽ:

1. Theo dõi tần suất người dùng quan sát từng chủ đề trong mỗi **epoch** mới. Một epoch là một tuần theo mặc định, nhưng độ dài có thể được thay đổi cho mục đích kiểm tra (xem [Gợi ý kiểm tra](#testing_hints)).

2. Chọn các chủ đề hàng đầu cho mỗi người dùng, vào cuối mỗi epoch:
   1. Chrome chuyển đổi tên máy chủ miền người gọi từ lịch sử duyệt web của người dùng thành các chủ đề.
   2. Các chủ đề này được sắp xếp trước theo nhóm, sau đó theo tần suất. Tức là, nếu hai chủ đề ở cùng một nhóm nhưng có tần suất khác nhau, chủ đề tần suất cao hơn được sắp xếp cao hơn.
   3. Chrome chọn năm chủ đề hàng đầu làm chủ đề hàng đầu của người dùng cho epoch đó.

3. Các chủ đề hàng đầu được trả về cho `ad-tech1.example`, chỉ nếu `ad-tech1.example` xuất hiện trong danh sách các miền người gọi cho mỗi chủ đề, như được lưu trữ trong mục lịch sử của chủ đề.

Sau đó `ad-tech1.example` chọn một quảng cáo phù hợp để phục vụ cho người dùng, dựa trên các chủ đề được trả về.

## Các tính năng API nào kích hoạt Topics API?

Các tính năng sau đây đều phục vụ mục đích kép, trả về các chủ đề hàng đầu của người dùng cho người gọi và kích hoạt trình duyệt ghi lại lần truy cập trang hiện tại như đã được quan sát bởi người gọi. Để làm như vậy, chúng cần được bao gồm trong `<iframe>` ad tech gọi; `<iframe>` sau đó phải được nhúng trên các trang nơi bạn muốn quan sát các chủ đề.

- Bạn có thể chỉ định tùy chọn `browsingTopics: true` trong đối tượng tùy chọn của lời gọi {{domxref("Window/fetch", "fetch()")}} đến nền tảng ad tech.
- Bạn cũng có thể truyền `browsingTopics: true` vào đối tượng tùy chọn của lời gọi hàm khởi tạo {{domxref("Request.Request", "Request()")}}, và truyền đối tượng {{domxref("Request")}} kết quả vào lời gọi {{domxref("Window/fetch", "fetch()")}}.
- Bạn có thể đặt thuộc tính `browsingtopics` trên `<iframe>`, cùng lúc hoặc trước khi đặt thuộc tính `src` để tải nguồn. Điều này có thể được thực hiện:
  - Khai báo trong HTML:

  ```html
  <iframe browsingtopics src="ad-tech1.example"> ... </iframe>
  ```

  - Lập trình bằng cách đặt thuộc tính {{domxref("HTMLIFrameElement.browsingTopics")}} tương đương thành `true`:

  ```js
  const iframeElem = document.querySelector("iframe");
  iframeElem.browsingTopics = true;
  ```

Khi yêu cầu liên quan đến một trong các tính năng trên được gửi:

1. Tiêu đề {{httpheader("Sec-Browsing-Topics")}} được gửi cùng với yêu cầu, chứa các chủ đề hàng đầu cho người dùng hiện tại.
2. Máy chủ ad tech chọn quảng cáo phù hợp để hiển thị trong `<iframe>`, dựa trên các chủ đề này, và gửi dữ liệu cần thiết để hiển thị trong phản hồi.
3. Tiêu đề {{httpheader("Observe-Browsing-Topics")}} nên được đặt trong phản hồi cho yêu cầu, điều này có tác dụng khiến trình duyệt ghi lại lần truy cập trang hiện tại như đã được quan sát bởi nhà cung cấp ad tech gọi, để các chủ đề liên quan sẽ được ghi lại trong mục lịch sử chủ đề, và sau đó được sử dụng trong [chọn chủ đề](#selecting_topics_of_interest_to_influence_ad_choice).

### Phương thức `browsingTopics()`

Ngoài ra, `<iframe>` được nhúng có thể gọi {{domxref("Document.browsingTopics()")}} để trả về các chủ đề hàng đầu hiện tại của người dùng, sau đó có thể được trả về cho nền tảng ad tech trong yêu cầu fetch tiếp theo. Điều này không dựa trên các tiêu đề HTTP, nhưng kém hiệu quả hơn một chút. Bạn được khuyến khích sử dụng một trong các phương thức tiêu đề HTTP được liệt kê ở trên, chỉ sử dụng `browsingTopics()` trong các trường hợp không thể sửa đổi tiêu đề.

## Tập chủ đề riêng tư

Người gọi chỉ có thể truy cập các chủ đề mà họ chính mình đã quan sát cho người dùng, không phải các chủ đề được quan sát bởi người gọi khác. Ví dụ:

- Nếu nền tảng `ad-tech1.example` có `<iframe>` được nhúng trên `tennis.example` bao gồm tính năng Topics API, họ sẽ quan sát các chủ đề như "Sports" và "Tennis" cho người dùng truy cập trang đó.
- Nếu một nền tảng ad tech khác, `ad-tech2.example`, có `<iframe>` Topics API được nhúng trên "gardening.example", họ sẽ quan sát chủ đề "Gardening".

Các nền tảng ad tech này chỉ nhận được các chủ đề cho người dùng mà họ đã quan sát. Trong ví dụ này, `ad-tech1.example` sẽ không nhận được "Gardening" và `ad-tech2.example` sẽ không nhận được "Tennis".

## Ví dụ

### Sử dụng `Document.browsingTopics()`

```js
// Lấy mảng chủ đề cho người dùng này
const topics = await document.browsingTopics();

// Yêu cầu quảng cáo sáng tạo
const response = await fetch("https://ads.example/get-creative", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify(topics),
});

// Lấy JSON từ phản hồi
const creative = await response.json();

// Hiển thị quảng cáo
```

### Truyền tùy chọn `browsingTopics` vào `fetch()`

```js
// Yêu cầu quảng cáo sáng tạo
const response = await fetch("https://ads.example/get-creative", {
  browsingTopics: true,
});

// Lấy JSON từ phản hồi
const creative = await response.json();

// Hiển thị quảng cáo
```

### Bao gồm thuộc tính `browsingtopics` trong `<iframe>`

```html
<iframe browsingtopics src="ad-tech1.example"> ... </iframe>
```

## Gợi ý kiểm tra

### Chrome

Độ dài epoch mặc định để quan sát các chủ đề là một tuần, quá dài để kiểm tra mã sử dụng Topics API. Để rút ngắn điều này cho mục đích kiểm tra, trong Chrome bạn có thể mở trình duyệt với flag tính năng như sau:

```bash
BrowsingTopicsParameters:time_period_per_epoch/15s/max_epoch_introduction_delay/3s
```

Xem [Chạy Chromium với các tùy chọn dòng lệnh](https://www.chromium.org/developers/how-tos/run-chromium-with-flags/) để biết thêm thông tin về cách thực hiện điều này.

Bạn cũng có thể kiểm tra mã Topics API của mình cục bộ mà không cần [đăng ký](/en-US/docs/Web/API/Topics_API#enrollment) bằng cách bật flag nhà phát triển Chrome sau:

`chrome://flags/#privacy-sandbox-enrollment-overrides`

## Xem thêm

- [Topics API](https://privacysandbox.google.com/private-advertising/topics) trên privacysandbox.google.com (2023)
