---
title: Attribution-Reporting-Register-Trigger header
short-title: Attribution-Reporting-Register-Trigger
slug: Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Attribution-Reporting-Register-Trigger
sidebar: http
---

{{deprecated_header}}

Tiêu đề HTTP **`Attribution-Reporting-Register-Trigger`** {{Glossary("response header")}} đăng ký một tính năng trang là [trigger phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers). Tiêu đề này được đưa vào như một phần của phản hồi cho một yêu cầu chứa tiêu đề {{HTTPHeader("Attribution-Reporting-Eligible")}}.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

> [!NOTE]
> Nếu trang web gọi không có Attribution Reporting API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công, tiêu đề `Attribution-Reporting-Register-Trigger` bị bỏ qua và các trigger phân bổ không được đăng ký.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Attribution-Reporting-Register-Trigger: <json-string>
```

## Chỉ thị

- `<json-string>`
  - : Chuỗi JSON cung cấp dữ liệu có thể được đưa vào các báo cáo được tạo, chẳng hạn như ID của trigger, và các giá trị ưu tiên và loại bỏ trùng lặp. Các trường có sẵn như sau:
    - `"aggregatable_trigger_data"`
      - : Mảng các đối tượng, mỗi đối tượng xác định một khóa tổng hợp để áp dụng cho các khóa nguồn khác nhau. Mỗi đối tượng chứa các thuộc tính sau:
        - `"key_piece"`
          - : Giá trị thập lục phân đại diện cho một khóa.
        - `"source_keys"`
          - : Mảng chứa một hoặc nhiều giá trị khóa cho dữ liệu.
    - `"aggregatable_values"`
      - : Đối tượng chứa các thuộc tính đại diện cho giá trị cho mỗi điểm dữ liệu được xác định trong `"aggregatable_trigger_data"`. Trong mỗi trường hợp, tên thuộc tính bằng tên được xác định trong `"source_keys"`, và giá trị thuộc tính là bất kỳ giá trị tùy ý nào bạn yêu cầu.
    - `"debug_key"` {{optional_inline}}
      - : Số đại diện cho khóa gỡ lỗi. Đặt giá trị này nếu bạn muốn tạo [báo cáo gỡ lỗi](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#debug_reports) cùng với báo cáo phân bổ liên quan.
    - `"debug_reporting"` {{optional_inline}}
      - : Giá trị boolean. Nếu `debug_key` được đặt, đặt giá trị này thành `true` để chỉ định rằng báo cáo gỡ lỗi được tạo ra nên là báo cáo gỡ lỗi chi tiết.
    - `"filters"` {{optional_inline}}
      - : Đối tượng chứa dữ liệu tùy chỉnh có thể được sử dụng để lọc trigger nào tạo ra báo cáo. Xem [Filters](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#filters) để biết thêm chi tiết.
    - `"event_trigger_data"`
      - : Đối tượng đại diện cho dữ liệu về trigger. Các trường con có sẵn như sau:
        - `"trigger_data"`
          - : Chuỗi đại diện cho dữ liệu mô tả trigger, thường được sử dụng để chỉ ra các sự kiện như "người dùng thêm mặt hàng vào giỏ hàng" hoặc "người dùng đăng ký danh sách gửi thư". Giá trị này sẽ được đưa vào báo cáo cấp sự kiện được tạo ra, nếu có, mặc dù nó sẽ bị sửa đổi dựa trên trường [`"trigger_data_matching"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#trigger_data_matching) của nguồn được phân bổ.

            > [!NOTE]
            > Các giá trị được sử dụng để đại diện cho mỗi sự kiện và số lượng phần tử trong mảng là hoàn toàn tùy ý và do bạn là nhà phát triển xác định. Mảng có thể chứa các giá trị không được sử dụng, nhưng các giá trị phải có mặt trong mảng để được trình duyệt phân bổ cho nguồn khi một trigger được đăng ký.

        - `"priority"` {{optional_inline}}
          - : Chuỗi đại diện cho giá trị ưu tiên cho trigger phân bổ. Theo mặc định, trigger được phân bổ cho nguồn khớp gần đây nhất. Đối với cả báo cáo cấp sự kiện và báo cáo tóm tắt, bạn đặt số ưu tiên cao hơn để khiến trigger khớp với các nguồn cũ hơn. Ví dụ, giá trị `2` có ưu tiên hơn giá trị mặc định là `1`. Xem [Ưu tiên và giới hạn báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#report_priorities_and_limits) để biết thêm thông tin.
        - `"deduplication_key"` {{optional_inline}}
          - : Chuỗi đại diện cho một khóa duy nhất có thể được sử dụng để ngăn chặn các phân bổ bị trùng lặp — ví dụ nếu người dùng thêm cùng một mặt hàng vào giỏ hàng nhiều lần. Xem [Ngăn chặn trùng lặp trong báo cáo](https://privacysandbox.google.com/private-advertising/attribution-reporting/prevent-duplication) để biết thêm thông tin.
        - `"filters"` {{optional_inline}}
          - : Đối tượng chứa các bộ lọc thực hiện lọc có chọn lọc để đặt `"trigger_data"`, `"priority"` và `"deduplication_key"` dựa trên `filter_data` được đặt trong tiêu đề {{HTTPHeader("Attribution-Reporting-Register-Source")}} tương ứng. Xem [Filters](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#filters) để biết thêm thông tin.

## Ví dụ

### Đăng ký trigger cho báo cáo cấp sự kiện

Máy chủ Node.js có thể đặt tiêu đề phản hồi `Attribution-Reporting-Register-Trigger` như sau để đăng ký trigger nhằm khớp với nguồn phân bổ báo cáo cấp sự kiện:

```js
res.set(
  "Attribution-Reporting-Register-Trigger",
  JSON.stringify({
    event_trigger_data: [
      {
        trigger_data: "4",
        priority: "1000000000000",
        deduplication_key: "2345698765",
      },
    ],
    debug_key: "1115698977",
  }),
);
```

### Đăng ký trigger cho báo cáo tóm tắt

Khi đăng ký trigger nhằm khớp với nguồn phân bổ báo cáo tóm tắt, bạn cần bao gồm các trường sau:

```js
res.set(
  "Attribution-Reporting-Register-Trigger",
  JSON.stringify({
    aggregatable_trigger_data: [
      {
        key_piece: "0x400",
        source_keys: ["campaignCounts"],
      },
      {
        key_piece: "0xA80",
        source_keys: ["geoValue", "nonMatchingKeyIdsAreIgnored"],
      },
    ],
    aggregatable_values: {
      campaignCounts: 32768,
      geoValue: 1664,
    },
    debug_key: "1115698977",
  }),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Attribution-Reporting-Eligible")}}
- {{HTTPHeader("Attribution-Reporting-Register-Source")}}
- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API)
