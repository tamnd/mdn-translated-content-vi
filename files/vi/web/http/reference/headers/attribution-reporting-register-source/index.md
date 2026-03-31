---
title: Attribution-Reporting-Register-Source header
short-title: Attribution-Reporting-Register-Source
slug: Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Attribution-Reporting-Register-Source
sidebar: http
---

{{deprecated_header}}

Tiêu đề HTTP **`Attribution-Reporting-Register-Source`** {{Glossary("response header")}} đăng ký một tính năng trang là [nguồn phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources).
Tiêu đề này được đưa vào như một phần của phản hồi cho một yêu cầu chứa tiêu đề {{HTTPHeader("Attribution-Reporting-Eligible")}}. Nó cung cấp thông tin mà trình duyệt nên lưu trữ khi người dùng tương tác với nguồn phân bổ. Thông tin bạn đưa vào tiêu đề này cũng xác định các loại báo cáo mà trình duyệt có thể tạo ra.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

> [!NOTE]
> Nếu trang web gọi không có Attribution Reporting API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công, tiêu đề `Attribution-Reporting-Register-Source` bị bỏ qua và các nguồn phân bổ không được đăng ký.

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
Attribution-Reporting-Register-Source: <json-string>
```

## Chỉ thị

- `<json-string>`
  - : Chuỗi JSON cung cấp thông tin mà trình duyệt nên lưu trữ khi nguồn phân bổ được tương tác. Các trường có sẵn như sau:
    - `"source_event_id"` {{optional_inline}}
      - : Chuỗi đại diện cho ID của nguồn phân bổ, có thể được sử dụng để ánh xạ đến thông tin khác khi nguồn phân bổ được tương tác, hoặc tổng hợp thông tin tại endpoint báo cáo. Chuỗi phải chỉ bao gồm số nguyên 64-bit không dấu định dạng cơ số 10.
    - `"destination"`
      - : Một chuỗi đơn hoặc một mảng 1–3 chuỗi. Các chuỗi này phải chứa một URL đầy đủ tương ứng với {{glossary("site")}}, bao gồm lược đồ, nơi trigger dự kiến xảy ra. Chúng được sử dụng để khớp trigger phân bổ với nguồn khi trigger được tương tác.
    - `"aggregation_keys"` {{optional_inline}}
      - : Một đối tượng chứa các khóa do người dùng cung cấp đại diện cho các điểm dữ liệu khác nhau để tổng hợp giá trị báo cáo dưới.
    - `"aggregatable_report_window"` {{optional_inline}}
      - : Chuỗi đại diện cho thời gian tính bằng giây sau đó dữ liệu trigger sẽ không còn được đưa vào các báo cáo tổng hợp được tạo ra (đây được gọi là **cửa sổ báo cáo**). Nếu không được đặt, mặc định là giá trị `"expiry"`.
    - `"debug_key"` {{optional_inline}}
      - : Số nguyên 64-bit không dấu định dạng cơ số 10 đại diện cho khóa gỡ lỗi. Đặt giá trị này nếu bạn muốn tạo [báo cáo gỡ lỗi](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#debug_reports) cùng với báo cáo phân bổ liên quan.
    - `"debug_reporting"` {{optional_inline}}
      - : Giá trị boolean. Nếu `debug_key` được đặt, đặt giá trị này thành `true` để chỉ định rằng báo cáo gỡ lỗi được tạo ra nên là báo cáo gỡ lỗi chi tiết.
    - `"event_level_epsilon"` {{optional_inline}}
      - : Số bằng hoặc lớn hơn `0`, kiểm soát lượng [nhiễu thêm vào báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#adding_noise_to_reports). Giá trị epsilon nhỏ hơn dẫn đến nhiễu nhiều hơn và do đó cung cấp bảo vệ quyền riêng tư lớn hơn. Giá trị tối đa và mặc định sẽ thay đổi giữa các triển khai; Chrome ví dụ có giá trị tối đa và mặc định là `14`.
    - `"event_report_window"` {{optional_inline}}
      - : Chuỗi đại diện cho thời gian tính bằng giây, sau đó các trigger tiếp theo sẽ không thể phân bổ cho nguồn này vì mục đích tạo báo cáo cấp sự kiện (đây được gọi là **cửa sổ báo cáo**). Nếu không được đặt, cửa sổ báo cáo sự kiện dự phòng về giá trị `"expiry"`.
        > [!NOTE]
        > Nếu `"event_report_window"` được chỉ định thì không thể chỉ định `"event_report_windows"`, nếu không đăng ký nguồn sẽ thất bại.
    - `"event_report_windows"` {{optional_inline}}
      - : Đối tượng đại diện cho một loạt cửa sổ báo cáo, bắt đầu tại `"start_time"`, với các báo cáo cho nguồn này được gửi sau mỗi thời gian kết thúc được chỉ định trong `"end_times"`. Điều này có thể được sử dụng để thay đổi thời gian gửi báo cáo qua nhiều báo cáo. Nếu không được đặt, cửa sổ báo cáo sự kiện dự phòng về giá trị `"expiry"`. Các thuộc tính như sau:
        - `"start_time"` {{optional_inline}}: Số không âm chỉ định thời gian bắt đầu cho các cửa sổ báo cáo. Nếu không được chỉ định, mặc định là `0`.
        - `"end_times"`: Mảng các số dương chỉ định thời gian kết thúc cho các cửa sổ báo cáo tiếp theo. Các giá trị phải tăng dần và lớn hơn `"start_time"`.
          > [!NOTE]
          > Nếu `"event_report_windows"` được chỉ định thì không thể chỉ định `"event_report_window"`, nếu không đăng ký nguồn sẽ thất bại.
    - `"expiry"` {{optional_inline}}
      - : Chuỗi đại diện cho thời gian hết hạn tính bằng giây cho nguồn phân bổ, sau đó nó sẽ không còn hoạt động (tức là các trigger tiếp theo sẽ không thể phân bổ cho nguồn này). Thời gian hết hạn tối đa cho phép là 2592000 giây (30 ngày), đây cũng là giá trị mặc định nếu `"expiry"` không được đặt rõ ràng.
    - `"filter_data"` {{optional_inline}}
      - : Đối tượng xác định dữ liệu tùy chỉnh có thể được sử dụng để lọc chuyển đổi nào tạo ra báo cáo. Xem [Filters](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#filters) để biết thêm chi tiết.
    - `"max_event_level_reports"` {{optional_inline}}
      - : Số từ `0` đến `20`, bao gồm, chỉ định tổng số báo cáo cấp sự kiện mà nguồn này có thể tạo ra. Sau khi đạt tối đa này, nguồn không còn có khả năng tạo ra bất kỳ dữ liệu mới nào. Nếu không được chỉ định, `"max_event_level_reports"` mặc định là `3` cho các nguồn dựa trên điều hướng và `1` cho các nguồn dựa trên sự kiện (dựa trên hình ảnh hoặc script).
    - `"priority"` {{optional_inline}}
      - : Chuỗi đại diện cho giá trị ưu tiên cho nguồn phân bổ. Theo mặc định, chuyển đổi được phân bổ cho nguồn khớp gần đây nhất. Đối với cả báo cáo cấp sự kiện và báo cáo tóm tắt, bạn đặt số ưu tiên cao hơn để ưu tiên các nguồn cụ thể. Ví dụ, giá trị `2` có ưu tiên hơn giá trị mặc định là `1`. Xem [Ưu tiên và giới hạn báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#report_priorities_and_limits) để biết thêm thông tin.
    - `"trigger_data"` {{optional_inline}}
      - : Mảng các số nguyên 32-bit không dấu đại diện cho dữ liệu mô tả các sự kiện trigger khác nhau có thể khớp với nguồn này. Ví dụ, "người dùng thêm mặt hàng vào giỏ hàng" hoặc "người dùng đăng ký danh sách gửi thư" có thể là các hành động xảy ra tại trang web trigger có thể khớp với nguồn này và chỉ ra một loại chuyển đổi nào đó mà nhà quảng cáo đang cố gắng đo lường. Chúng phải được khớp với `"trigger_data"` được chỉ định trong [triggers](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger#trigger_data) để phân bổ cấp sự kiện xảy ra. Nếu bị bỏ qua, `"trigger_data"` mặc định là `[0, 1, 2, 3, 4, 5, 6, 7]` cho các nguồn dựa trên điều hướng và `[0, 1]` cho các nguồn dựa trên sự kiện (dựa trên hình ảnh hoặc script).

        > [!NOTE]
        > Các giá trị được sử dụng để đại diện cho mỗi sự kiện và số lượng phần tử trong mảng là hoàn toàn tùy ý và do bạn là nhà phát triển xác định. Mảng có thể chứa các giá trị không được sử dụng, nhưng các giá trị phải có mặt trong mảng để được trình duyệt phân bổ cho nguồn khi một trigger được đăng ký.

    - `"trigger_data_matching"` {{optional_inline}}
      - : Chuỗi chỉ định cách `"trigger_data"` từ trigger được khớp với `"trigger_data"` của nguồn. Các giá trị có thể là:
        - `"exact"`: `"trigger_data"` từ trigger phải khớp chính xác với một giá trị trong `"trigger_data"` của nguồn; nếu không có khớp như vậy, không có phân bổ cấp sự kiện nào xảy ra.
        - `"modulus"`: Trong trường hợp này, phép tính sau được thực hiện — `d % allowedValues.size` — trong đó `d` là `"trigger_data"` từ trigger, và `allowedValues` là chuỗi các giá trị trong mảng `"trigger_data"` của nguồn. Nếu kết quả của phép tính này khớp với một giá trị trong mảng `"trigger_data"` của nguồn thì khớp thành công. Trong trường hợp như vậy, giá trị sẽ luôn khớp, trừ khi `allowedValues` rỗng.

        Chế độ `"modulus"` tồn tại chủ yếu để tương thích ngược với hành vi của API trước khi `"exact"` được giới thiệu, và như vậy, bạn sẽ khó có khả năng sử dụng nó. Nó vẫn hữu ích trong các trường hợp cụ thể yêu cầu một loại nén rất cụ thể dẫn đến các tiêu đề đăng ký nhỏ hơn. Điều này có thể cần thiết khi sử dụng logic lọc phức tạp cần đặt dữ liệu trigger khác nhau dựa trên loại nguồn theo số lượng tối đa các mục `"trigger_data"` của nguồn.

        > [!NOTE]
        > Nếu `"modulus"` được sử dụng, `"trigger_data"` của nguồn phải tạo thành một chuỗi liên tục các số nguyên bắt đầu từ 0. Nếu dữ liệu trigger không tạo thành chuỗi như vậy thì xảy ra lỗi.

        Nếu không được chỉ định, `"trigger_data_matching"` mặc định là `"modulus"`. Một lần nữa, lý do là tương thích ngược: bỏ qua trường `"trigger_data_matching"` cần dẫn đến hành vi tương tự được quan sát trước khi trường này được giới thiệu.

## Ví dụ

### Đăng ký nguồn cho báo cáo cấp sự kiện

Máy chủ Node.js có thể đặt tiêu đề phản hồi `Attribution-Reporting-Register-Source` như sau để khiến trình duyệt tạo báo cáo cấp sự kiện khi trigger khớp với nguồn:

```js
res.set(
  "Attribution-Reporting-Register-Source",
  JSON.stringify({
    source_event_id: "412444888111012",
    destination: "https://shop.example",
    trigger_data: [0, 1, 2, 3, 4],
    trigger_data_matching: "exact",
    expiry: "604800",
    priority: "100",
    debug_key: "122939999",
    event_report_window: "86400",
  }),
);
```

### Đăng ký nguồn cho báo cáo tóm tắt

Để khiến trình duyệt tạo báo cáo tóm tắt khi trigger khớp với nguồn, bạn cần bao gồm một số trường bổ sung, _ngoài_ các trường cần thiết để tạo báo cáo cấp sự kiện.

```js
res.set(
  "Attribution-Reporting-Register-Source",
  JSON.stringify({
    source_event_id: "412444888111012",
    destination: "https://shop.example",
    trigger_data: [0, 1, 2, 3, 4],
    trigger_data_matching: "exact",
    expiry: "604800",
    priority: "100",
    debug_key: "122939999",
    event_report_window: "86400",

    aggregation_keys: {
      campaignCounts: "0x159",
      geoValue: "0x5",
    },
    aggregatable_report_window: "86400",
  }),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Attribution-Reporting-Eligible")}}
- {{HTTPHeader("Attribution-Reporting-Register-Trigger")}}
- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API)
