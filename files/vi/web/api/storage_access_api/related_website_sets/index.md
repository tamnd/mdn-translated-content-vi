---
title: Tập hợp Website Liên Quan
slug: Web/API/Storage_Access_API/Related_website_sets
page-type: guide
status:
  - deprecated
  - non-standard
spec-urls: https://wicg.github.io/first-party-sets/
---

{{DefaultAPISidebar("Storage Access API")}}{{Non-standard_Header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](#standards_positions) dưới đây để biết chi tiết về sự phản đối.

Tập hợp website liên quan là một cơ chế để định nghĩa một tập hợp các trang liên quan chia sẻ nội dung đáng tin cậy. Do đó, các trình duyệt có thể cấp quyền truy cập mặc định cho các trang này vào [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và [trạng thái không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning) khi chúng có nội dung được nhúng trong các thành viên khác của tập hợp, mà không yêu cầu người dùng cấp quyền truy cập vào [Storage Access API](/en-US/docs/Web/API/Storage_Access_API) thông qua lời nhắc quyền.

## Khái niệm và cách sử dụng

Hãy xem xét các tình huống nơi bạn có một loạt các trang liên quan với các tên miền khác nhau, và bạn muốn cấp quyền truy cập nội dung trang vào cookie bên thứ ba và trạng thái không phân vùng khi được tải trong ngữ cảnh bên thứ ba bên trong các trang liên quan khác (tức là được nhúng trong {{htmlelement("iframe")}}). Các trường hợp sử dụng điển hình là:

- Trang ứng dụng: Một ứng dụng duy nhất có thể được triển khai trên nhiều trang, nhằm mục đích cho phép người dùng điều hướng giữa chúng một cách liền mạch trong một phiên duy nhất.
- Trang thương hiệu: Một tập hợp tài sản thương hiệu có thể được chứa trong một trang duy nhất nhưng sau đó được triển khai trên nhiều tên miền, bao gồm dữ liệu phiên liên quan đến tùy chọn người dùng, tùy chỉnh, v.v.

## Cách RWS hoạt động

Một tập hợp website liên quan bao gồm một trang chính và tối đa năm trang liên quan.

### Cấu trúc JSON

Một tập hợp được biểu diễn bằng cấu trúc JSON. Một ví dụ giả thuyết như sau:

```json
{
  "sets": [
    {
      "contact": "địa chỉ email hoặc bí danh nhóm nếu có",
      "primary": "https://primary1.com",
      "associatedSites": [
        "https://associateA.com",
        "https://associateB.com",
        "https://associateC.com"
      ],
      "serviceSites": ["https://servicesiteA.com"],
      "rationaleBySite": {
        "https://associateA.com": "Giải thích về mối liên kết với trang chính",
        "https://associateB.com": "Giải thích về mối liên kết với trang chính",
        "https://associateC.com": "Giải thích về mối liên kết với trang chính",
        "https://serviceSiteA.com": "Giải thích về hỗ trợ chức năng dịch vụ"
      },
      "ccTLDs": {
        "https://associateA.com": [
          "https://associateA.ca",
          "https://associateA.co.uk"
        ],
        "https://associateB.com": [
          "https://associateB.ru",
          "https://associateB.co.kr"
        ],
        "https://primary1.com": ["https://primary1.co.uk"]
      }
    }
  ]
}
```

Để sử dụng một tập hợp, JSON của nó phải được thêm vào file `related_website_sets.JSON` có sẵn trên [kho GitHub Related Website Sets](https://github.com/GoogleChrome/related-website-sets/blob/main/related_website_sets.JSON), mà Chrome sau đó sử dụng để lấy danh sách các tập hợp để áp dụng hành vi RWS.

### File `.well-known`

Mỗi trang trong tập hợp cũng phải phục vụ file [`.well-known`](https://en.wikipedia.org/wiki/Well-known_URI) tại `/.well-known/related-website-set.json`, dùng để xác minh cấu trúc tập hợp và mối quan hệ giữa các trang trong tập hợp.

## Bảo mật RWS

RWS đã được thiết kế với bảo mật trong tâm trí. Sẽ rất thảm họa nếu một trang tác nhân xấu có thể tuyên bố là một phần của tập hợp và có được các đặc quyền kèm theo.

## Ví dụ

Để biết các ví dụ code, xem [Tập hợp Website Liên Quan: hướng dẫn dành cho nhà phát triển](https://privacysandbox.google.com/cookies/related-website-sets-integration) trên privacysandbox.google.com (2024)

## Thông số kỹ thuật

{{Specifications}}

### Vị trí tiêu chuẩn

Hai nhà cung cấp trình duyệt [phản đối](/en-US/docs/Glossary/Web_standards#opposing_standards) thông số này. Các vị trí đã biết như sau:

- Mozilla (Firefox): [Tiêu cực](https://mozilla.github.io/standards-positions/#first-party-sets)
- Apple (Safari): [Tiêu cực](https://webkit.org/standards-positions/#position-93)

## Xem thêm

- [Storage Access API](/en-US/docs/Web/API/Storage_Access_API)
- [Tập hợp Website Liên Quan](https://privacysandbox.google.com/cookies/related-website-sets) trên privacysandbox.google.com (2023)
