---
title: "Document: phương thức browsingTopics()"
short-title: browsingTopics()
slug: Web/API/Document/browsingTopics
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.browsingTopics
---

{{APIRef("Topics API")}}{{non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](/en-US/docs/Web/API/Topics_API#standards_positions) bên dưới để biết chi tiết về sự phản đối.

> [!NOTE]
> Cần có [quy trình đăng ký](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) để sử dụng tính năng này trong các ứng dụng của bạn.

Phương thức `browsingTopics()` của giao diện {{domxref("Document")}} trả về một promise sẽ fulfilled với một mảng các đối tượng đại diện cho các chủ đề hàng đầu của người dùng, mỗi chủ đề từ mỗi trong ba epoch gần nhất. Các chủ đề này sau đó có thể được trả lại cho nền tảng công nghệ quảng cáo trong một yêu cầu fetch tiếp theo. Theo mặc định, phương thức này cũng khiến trình duyệt ghi lại lượt truy cập trang hiện tại như được quan sát bởi người gọi, vì vậy tên máy chủ của trang có thể được sử dụng sau này trong tính toán chủ đề.

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết thêm chi tiết.

> [!NOTE]
> `browsingTopics()` không dựa vào tiêu đề HTTP để gửi chủ đề và đánh dấu chủ đề đã được quan sát như các [tính năng kích hoạt Topics API khác](/en-US/docs/Web/API/Topics_API/Using#what_api_features_enable_the_topics_api), nhưng nó có hiệu suất thấp hơn. Bạn nên sử dụng một trong các tính năng sử dụng tiêu đề HTTP, chỉ dự phòng `browsingTopics()` trong các tình huống không thể sửa đổi tiêu đề.

## Cú pháp

```js-nolint
browsingTopics()
browsingTopics(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn, có thể chứa các thuộc tính sau:
    - `skipObservation`
      - : Một giá trị boolean, nếu được đặt thành `true`, khiến trình duyệt _không_ quan sát chủ đề khi `browsingTopics()` được gọi. Mặc định là `false`, khiến chủ đề được quan sát.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ fulfilled với một mảng tối đa ba đối tượng đại diện cho các chủ đề đã chọn của người dùng hiện tại cho ba epoch gần nhất. Mỗi đối tượng chứa các thuộc tính sau:

- `configVersion`
  - : Một chuỗi xác định thuật toán (khác với phần mô hình) được sử dụng để tính toán chủ đề.
- `modelVersion`
  - : Một chuỗi đại diện cho mô hình được sử dụng để phân loại một chuỗi (chẳng hạn như tên máy chủ của một trang web) thành các ID chủ đề.
- `taxonomyVersion`
  - : Một chuỗi đại diện cho phiên bản phân loại được sử dụng.
- `topic`
  - : Một số đại diện cho ID của chủ đề, có thể được trình duyệt sử dụng để truy xuất chủ đề từ phân loại (xem một [phân loại sở thích](https://github.com/patcg-individual-drafts/topics/blob/main/taxonomy_v1.md) ví dụ).
- `version`
  - : `configVersion`, `modelVersion` và `taxonomyVersion`, được nối với nhau bằng dấu hai chấm (`:`) giữa mỗi giá trị.

Các giá trị thuộc tính chính xác có thể khác nhau tùy theo triển khai trình duyệt. Một đối tượng ví dụ từ Chrome có thể như sau:

```json
{
  "configVersion": "chrome.1",
  "modelVersion": "1",
  "taxonomyVersion": "1",
  "topic": 43,
  "version": "chrome.1:1:1"
}
```

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Việc sử dụng [Topics API](/en-US/docs/Web/API/Topics_API) bị cấm bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}}.
    - Trang gọi không có Topics API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

```js
// Get an array of top topics for this user
const topics = await document.browsingTopics();

// Request an ad creative
const response = await fetch("https://ads.example/get-creative", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify(topics),
});

// Get the JSON from the response
const creative = await response.json();

// Display ad
```

## Đặc tả kỹ thuật

Tính năng này không phải là một phần của tiêu chuẩn chính thức, mặc dù nó được chỉ định trong [Topics API Unofficial Proposal Draft](https://patcg-individual-drafts.github.io/topics/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Topics API](/en-US/docs/Web/API/Topics_API)
