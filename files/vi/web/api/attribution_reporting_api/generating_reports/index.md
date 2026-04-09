---
title: Tạo báo cáo attribution
slug: Web/API/Attribution_Reporting_API/Generating_reports
page-type: guide
status:
  - deprecated
---

{{DefaultAPISidebar("Attribution Reporting API")}}{{deprecated_header}}

Bài viết này giải thích cách các báo cáo của [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) được tạo ra, bao gồm cả báo cáo attribution và báo cáo gỡ lỗi, cũng như cách bạn có thể kiểm soát các báo cáo được sinh ra. Nội dung này bao gồm việc xử lý nhiễu, ưu tiên báo cáo, lọc báo cáo và tạo báo cáo gỡ lỗi.

## Quy trình cơ bản

Khi có đối sánh giữa trigger và source, trình duyệt tạo một báo cáo và gửi nó bằng một yêu cầu [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) không kèm thông tin xác thực tới một endpoint cụ thể trên reporting origin:

- Với báo cáo cấp sự kiện, endpoint là `<reporting-origin>/.well-known/attribution-reporting/report-event-attribution`.
- Với báo cáo tóm tắt, endpoint là `<reporting-origin>/.well-known/attribution-reporting/report-aggregate-attribution`.

`<reporting-origin>` sẽ cùng origin với origin đã đăng ký source và trigger.

Dữ liệu báo cáo được chứa trong một cấu trúc JSON.

## Báo cáo cấp sự kiện

Báo cáo cấp sự kiện được tạo và được lên lịch gửi ở cuối **report window** chứa nó. Độ dài của report window được xác định bởi các giá trị đặt trong trường [`"event_report_window"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#event_report_window) hoặc [`"event_report_windows"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#event_report_windows) trong header {{httpheader("Attribution-Reporting-Register-Source")}} của source.

Nếu cả hai trường này đều không được chỉ định, report window sẽ quay về các giá trị mặc định sau:

- Với [source dựa trên sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#event-based_attribution_sources), report window mặc định kết thúc khi source hết hạn, được đặt trong trường [`"expiry"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#expiry) của `Attribution-Reporting-Register-Source`. Nếu không được đặt rõ ràng, mặc định là 30 ngày sau khi đăng ký.
- Với [source dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources), các report window mặc định là 2 ngày, 7 ngày và giá trị `"expiry"` của source.

Xem [Custom report windows](https://privacysandbox.google.com/private-advertising/attribution-reporting/custom-report-windows) để biết thêm chi tiết.

Khi báo cáo cấp sự kiện được nhận tại endpoint thích hợp, cách dữ liệu được xử lý, lưu trữ và hiển thị hoàn toàn do nhà phát triển quyết định. Một báo cáo cấp sự kiện điển hình có thể trông như sau:

```json
{
  "attribution_destination": "https://advertiser.example",
  "source_event_id": "412444888111012",
  "trigger_data": "4",
  "report_id": "123e4567-e89b-12d3-a456-426614174000",
  "source_type": "navigation",
  "randomized_trigger_rate": 0.34,
  "scheduled_report_time": "1692255696",
  "source_debug_key": 647775351539539,
  "trigger_debug_key": 647776891539539
}
```

Các thuộc tính như sau:

- `"attribution_destination"`
  - : Một chuỗi, hoặc một mảng gồm 2-3 chuỗi, tùy vào việc source có được đăng ký với nhiều đích đến hay không. Các chuỗi này biểu diễn URL hoặc các URL [`"destination"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#destination) attribution được đặt trong quá trình đăng ký source qua header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng.
- `"source_event_id"`
  - : Một chuỗi biểu diễn ID của attribution source. Giá trị này bằng với [`"source_event_id"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#source_event_id) được đặt khi đăng ký source (qua header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng).
- `"trigger_data"`
  - : Một chuỗi biểu diễn dữ liệu bắt nguồn từ attribution trigger, được đặt khi đăng ký trigger (giá trị [`"trigger_data"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger#trigger_data) được đặt qua header phản hồi {{httpheader("Attribution-Reporting-Register-Trigger")}} tương ứng).
- `"report_id"`
  - : Một chuỗi biểu diễn [Universally Unique Identifier (UUID)](/en-US/docs/Glossary/UUID) cho báo cáo này, có thể được dùng để ngăn đếm trùng lặp.
- `"source_type"`
  - : Một chuỗi có giá trị `"navigation"` hoặc `"event"`, lần lượt cho biết attribution source liên quan là [dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources) hay [dựa trên sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#event-based_attribution_sources).
- `"randomized_trigger_rate"`
  - : Một số ngẫu nhiên trong khoảng từ 0 đến 1, cho biết [nhiễu](#thêm-nhiễu-vào-báo-cáo) được áp dụng thường xuyên như thế nào đối với cấu hình source cụ thể này.
- `"scheduled_report_time"`
  - : Một chuỗi biểu diễn số giây tính từ Unix Epoch đến thời điểm trình duyệt ban đầu lên lịch gửi báo cáo (để tránh sai lệch do các thiết bị ngoại tuyến báo cáo muộn).
- `"source_debug_key"` {{optional_inline}}
  - : Một số nguyên không dấu 64 bit biểu diễn khóa gỡ lỗi cho attribution source. Giá trị này phản chiếu giá trị được đặt trong trường [`"debug_key"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#debug_key) của header {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng. Xem [Báo cáo gỡ lỗi](#báo-cáo-gỡ-lỗi) để biết thêm thông tin.
- `"trigger_debug_key"` {{optional_inline}}
  - : Một số nguyên không dấu 64 bit biểu diễn khóa gỡ lỗi cho attribution trigger. Giá trị này phản chiếu giá trị được đặt trong trường `"debug_key"` của header {{httpheader("Attribution-Reporting-Register-Trigger")}} tương ứng. Xem [Báo cáo gỡ lỗi](#báo-cáo-gỡ-lỗi) để biết thêm thông tin.

## Báo cáo tóm tắt

Một báo cáo tóm tắt được tạo từ nhiều báo cáo có thể tổng hợp nhận được tại endpoint thích hợp, sau đó được [gom lô](https://privacysandbox.google.com/private-advertising/attribution-reporting/summary-reports-intro#batching) để chuẩn bị cho việc xử lý bởi một [aggregation service](https://privacysandbox.google.com/private-advertising/aggregation-service). Sau khi điều này diễn ra, cách dữ liệu được xử lý, lưu trữ và hiển thị hoàn toàn do nhà phát triển quyết định.

Theo mặc định, một báo cáo có thể tổng hợp sẽ được tạo và lên lịch gửi sau khi trigger được tương tác, với một độ trễ ngẫu nhiên để làm mờ thời điểm và tăng cường quyền riêng tư. Đối với một attribution source đã đăng ký, các sự kiện attribution source sẽ được ghi lại từ lúc đăng ký cho đến khi source hết hạn; khoảng thời gian này được gọi là **report window**.

Thời điểm hết hạn được xác định bởi giá trị `expiry` được đặt trong header {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng; nếu không được đặt rõ ràng, mặc định là 30 ngày sau khi đăng ký. Lưu ý rằng độ dài report window còn có thể được sửa đổi thêm bằng cách đặt giá trị `aggregatable_report_window` trong header `Attribution-Reporting-Register-Source`. Xem [Custom report windows](https://privacysandbox.google.com/private-advertising/attribution-reporting/custom-report-windows) để biết thêm chi tiết.

> [!NOTE]
> Để tiếp tục bảo vệ quyền riêng tư của người dùng, các giá trị báo cáo tóm tắt liên quan đến mỗi attribution source có một tổng giá trị hữu hạn, gọi là **contribution budget**. Giá trị này có thể khác nhau giữa các cách triển khai API; trong Chrome nó là 65,536. Mọi lượt chuyển đổi tạo ra báo cáo khiến tổng giá trị vượt quá giới hạn đó sẽ không được ghi lại. Hãy chắc chắn rằng bạn theo dõi budget này và chia sẻ nó giữa các chỉ số khác nhau mà bạn muốn đo.

Một báo cáo có thể tổng hợp điển hình có thể trông như sau:

```json
{
  "shared_info": "{\"api\":\"attribution-reporting\",\"attribution_destination\":\"https://advertiser.example\",\"report_id\":\"123e4567-e89b-12d3-a456-426614174000\",\"reporting_origin\":\"https://reporter.example\",\"scheduled_report_time\":\"1692255696\",\"source_registration_time\":\"1692230400\",\"version\":\"3\"}",
  "aggregation_service_payloads": [
    {
      "payload": "[base64-encoded HPKE encrypted data readable only by the aggregation service]",
      "key_id": "[string identifying public key used to encrypt payload]",
      "debug_cleartext_payload": "[base64-encoded unencrypted payload]"
    }
  ],
  "aggregation_coordinator_origin": "https://publickeyservice.aws.privacysandboxservices.com",
  "source_debug_key": 647775351539539,
  "trigger_debug_key": 647776891539539
}
```

Các thuộc tính như sau:

- `"shared_info"`
  - : Đây là một đối tượng JSON được tuần tự hóa, cung cấp thông tin mà aggregation service sẽ dùng để ghép thành một báo cáo tóm tắt. Dữ liệu này được [mã hóa](/en-US/docs/Glossary/Encryption) bằng [AEAD](https://en.wikipedia.org/wiki/Authenticated_encryption) để ngăn việc can thiệp. Chuỗi được tuần tự hóa này biểu diễn các thuộc tính sau:
    - `"api"`
      - : Một giá trị liệt kê biểu diễn API đã kích hoạt việc tạo báo cáo. Hiện tại giá trị này luôn bằng `"attribution-reporting"`, nhưng trong tương lai có thể được mở rộng với các giá trị khác để hỗ trợ những API khác.
    - `"attribution_destination"`
      - : Một chuỗi biểu diễn URL [`"destination"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#destination) attribution được đặt trong quá trình đăng ký source (qua header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng).
    - `"report_id"`
      - : Một chuỗi biểu diễn [Universally Unique Identifier (UUID)](/en-US/docs/Glossary/UUID) cho báo cáo này, có thể được dùng để ngăn đếm trùng lặp.
    - `"reporting_origin"`
      - : Origin đã kích hoạt việc tạo báo cáo.
    - `"scheduled_report_time"`
      - : Một chuỗi biểu diễn số giây tính từ Unix Epoch đến thời điểm trình duyệt ban đầu lên lịch gửi báo cáo (để tránh sai lệch do các thiết bị ngoại tuyến báo cáo muộn).
    - `"source_registration_time"`
      - : Một chuỗi biểu diễn số giây tính từ Unix Epoch đến thời điểm attribution source được đăng ký, làm tròn xuống theo ngày.
    - `"version"`
      - : Một chuỗi biểu diễn phiên bản API được dùng để tạo báo cáo.
- `"aggregation_service_payloads"`
  - : Một mảng các đối tượng biểu diễn những payload chứa các đóng góp histogram mà aggregation service dùng để lắp ráp dữ liệu trong báo cáo. Hiện tại, mỗi báo cáo chỉ hỗ trợ một payload duy nhất do trình duyệt cấu hình. Trong tương lai có thể hỗ trợ nhiều payload tùy biến. Mỗi đối tượng payload có thể chứa các thuộc tính sau:
    - `"payload"`
      - : Một map [CBOR](https://cbor.io/) được mã hóa bằng [HPKE](https://datatracker.ietf.org/doc/rfc9180/) rồi [base64](/en-US/docs/Glossary/Base64)-encode, với cấu trúc sau (chỉ dùng JSON cho mục đích ký hiệu):

        ```json
        {
          "operation": "histogram",
          "data": [
            {
              "bucket": "<Encoded as a 16-byte (i.e. 128-bit) big-endian bytestring>",
              "value": "<Encoded as a 4-byte (i.e. 32-bit) big-endian bytestring>"
            }
            // …
          ]
        }
        ```

        `operation` luôn là `"histogram"`; điều này cho phép dịch vụ hỗ trợ các thao tác khác trong tương lai.

    - `"key_id"`
      - : Một chuỗi nhận diện khóa công khai được dùng để mã hóa payload.
    - `"debug_cleartext_payload"` {{optional_inline}}
      - : Thông tin gỡ lỗi tùy chọn.

- `"aggregation_coordinator_origin"`
  - : Tùy chọn triển khai của aggregation service.
- `"source_debug_key"` {{optional_inline}}
  - : Một số nguyên không dấu 64 bit biểu diễn khóa gỡ lỗi cho attribution source. Giá trị này phản chiếu giá trị được đặt trong trường [`"debug_key"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#debug_key) của header {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng. Xem [Báo cáo gỡ lỗi](#báo-cáo-gỡ-lỗi) để biết thêm thông tin.
- `"trigger_debug_key"` {{optional_inline}}
  - : Một số nguyên không dấu 64 bit biểu diễn khóa gỡ lỗi cho attribution trigger. Giá trị này phản chiếu giá trị được đặt trong trường `"debug_key"` của header {{httpheader("Attribution-Reporting-Register-Trigger")}} tương ứng. Xem [Báo cáo gỡ lỗi](#báo-cáo-gỡ-lỗi) để biết thêm thông tin.

## Thêm nhiễu vào báo cáo

<!--
THIS INFORMATION IS NOT COMPLETE; WE HAVE PARKED IT FOR NOW SO THAT WE CAN GET THIS DOCUMENTATION PUBLISHED, AND WE WILL DO MORE WORK ON ARA NOISE ON A FUTURE DATE, IF/WHEN THE DEMAND IS THERE

In the case of event-level reports, this is done using a randomized response algorithm, which works like so:

1. When an attribution source is stored, the browser generates a list of all possible sets of reports that could originate from the source's configuration (including the set consisting of no reports).
2. In a small percentage of cases, the browser prevents the source from being attributed and instead picks a random member of that list to use as the source's reports. The probability of this happening is based on the size of that list, the browser's implementation-specific privacy parameters, and the source's chosen [`"event_level_epsilon"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#event_level_epsilon).

Typical settings in the {{httpheader("Attribution-Reporting-Register-Source")}} header might look like so:

```json
{
  ...,
  "trigger_data": [0, 1, 2, 3, 4],
  "trigger_data_matching": "exact",
  ...,
}
```

The source `"trigger_data"` can have a maximum of 32 values. Increasing the number of values and `"event_report_windows"` increases the number of elements in the overall report set.

A matching {{httpheader("Attribution-Reporting-Register-Trigger")}} could contain the following:

```json
{
  ...,
  "event_trigger_data": [
    {
      // The value 4 is contained in the source data, therefore a match is possible
      "trigger_data": "4"
    },
  ],
  ...,
}
```

It is however still possible that a match may not occur, based on the randomized response algorithm described above.
-->

Nhiễu được thêm vào báo cáo để che khuất đầu ra liên quan đến một source cụ thể, từ đó bảo vệ quyền riêng tư của người dùng. Dữ liệu source chính xác không thể được nhận diện và quy ngược về từng người dùng riêng lẻ, nhưng các mẫu tổng thể rút ra từ dữ liệu vẫn giữ nguyên ý nghĩa.

Để biết thông tin về cách nhiễu hoạt động trong attribution reporting, xem:

- [Understanding noise in summary reports](https://privacysandbox.google.com/private-advertising/attribution-reporting/understanding-noise).
- [Data limits and noise](https://github.com/WICG/attribution-reporting-api/blob/main/EVENT.md#data-limits-and-noise)
- [Working with noise](https://privacysandbox.google.com/private-advertising/attribution-reporting/working-with-noise)

## Mức ưu tiên và giới hạn của báo cáo

Theo mặc định, mọi attribution source đều có cùng mức ưu tiên, và mô hình attribution là last-touch, nghĩa là một lượt chuyển đổi sẽ được gán cho sự kiện source khớp gần đây nhất. Với cả báo cáo cấp sự kiện lẫn báo cáo có thể tổng hợp, bạn có thể thay đổi mức ưu tiên của source bằng cách đặt giá trị mới cho trường `"priority"` trong header {{httpheader("Attribution-Reporting-Register-Source")}} tương ứng. Giá trị mặc định là `0`; nếu bạn đặt `"priority"` là `1` cho một source cụ thể thì source đó sẽ được đối sánh trước, trước mọi source có priority `0`. Các source có `"priority": "2"` sẽ được đối sánh trước source `"priority": "1"`, và cứ thế tiếp tục.

Mức ưu tiên của attribution trigger cũng hoạt động tương tự; bạn cũng có thể đặt mức ưu tiên trigger bằng cách thêm trường `"priority"` vào header {{httpheader("Attribution-Reporting-Register-Trigger")}} tương ứng, nhưng chỉ dành cho báo cáo cấp sự kiện.

Các loại source khác nhau có các giới hạn mặc định khác nhau:

- [Attribution source dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources) mặc định có giới hạn ba báo cáo. Ví dụ, giả sử người dùng nhấp vào quảng cáo rồi chuyển đổi bốn lần: họ truy cập trang chủ của nhà quảng cáo, sau đó xem trang sản phẩm, đăng ký nhận bản tin, và cuối cùng thực hiện mua hàng. Báo cáo cho giao dịch mua sẽ bị loại bỏ vì nó đến từ lượt chuyển đổi thứ tư.
- [Attribution source dựa trên sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#event-based_attribution_sources) mặc định có giới hạn một báo cáo.

> [!NOTE]
> Giới hạn báo cáo có thể được điều chỉnh bằng cách đặt một số lượng `"end_times"` khác trong trường [`"event_report_windows"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#event_report_windows) của header `Attribution-Reporting-Register-Source` tương ứng.

Khi một attribution được kích hoạt cho một sự kiện source nhất định, nếu số attribution tối đa (ba cho click, một cho image/script) đã đạt tới cho source này, trình duyệt sẽ:

- So sánh mức ưu tiên của báo cáo mới với mức ưu tiên của các báo cáo đã được lên lịch hiện có cho chính source đó.
- Xóa báo cáo có mức ưu tiên thấp nhất để thay vào đó lên lịch cho báo cáo mới. Nếu báo cáo mới lại chính là báo cáo có mức ưu tiên thấp nhất, nó sẽ bị bỏ qua và bạn sẽ không nhận được nó.

Nếu không có mức ưu tiên nào được đặt, trình duyệt quay về hành vi mặc định: mọi lượt chuyển đổi xảy ra sau lượt chuyển đổi thứ ba đối với click hoặc sau lượt chuyển đổi đầu tiên đối với view sẽ bị loại bỏ.

## Bộ lọc

Bạn có thể định nghĩa các quy tắc để quyết định lượt chuyển đổi nào sẽ tạo ra báo cáo bằng cách dùng bộ lọc. Ví dụ, bạn có thể chọn chỉ tính các lượt chuyển đổi cho một danh mục sản phẩm cụ thể, và lọc bỏ những lượt chuyển đổi thuộc danh mục khác.

Để khai báo bộ lọc:

1. Khi đăng ký source, thêm trường `filter_data` vào header {{httpheader("Attribution-Reporting-Register-Source")}} để định nghĩa các khóa bộ lọc mà bạn sẽ dùng để lọc các lượt chuyển đổi ở phía trigger. Đây hoàn toàn là các trường tùy biến. Ví dụ, để chỉ định chỉ những lượt chuyển đổi trên các subdomain cụ thể và cho các sản phẩm cụ thể:

   ```json
   {
     "filter_data": {
       "conversion_subdomain": [
         "electronics.megastore",
         "electronics2.megastore"
       ],
       "product": ["1234"]
     }
   }
   ```

2. Khi đăng ký trigger, thêm trường `filters` vào header {{httpheader("Attribution-Reporting-Register-Trigger")}}. Ví dụ sau khiến các tương tác trigger khớp với phần đăng ký source ở trên vì cả hai đều chứa trường `"conversion_subdomain"` là `"electronics.megastore"`. Ngược lại, bộ lọc `"directory"` sẽ bị bỏ qua khi thử đối sánh vì nó không được bao gồm trong phần đăng ký source ở trên.

   ```json
   {
     "filters": {
       "conversion_subdomain": ["electronics.megastore"],
       "directory": ["/store/electronics"]
     }
   }
   ```

Nếu các trường `"filter_data"` và `"filters"` có các trường con trùng nhau (như `"conversion_subdomain"` trong ví dụ trên) nhưng không có giá trị nào của trường con khớp nhau, trigger sẽ bị bỏ qua, dẫn đến không có đối sánh.

### Lọc dữ liệu trigger

Trường `event_trigger_data` trong header {{httpheader("Attribution-Reporting-Register-Trigger")}} có thể được mở rộng để thực hiện lọc có chọn lọc nhằm đặt `trigger_data`, `priority`, hoặc `deduplication_key`, dựa trên `filter_data` được định nghĩa trong header {{httpheader("Attribution-Reporting-Register-Source")}}.

Ví dụ:

```json
{
  "event_trigger_data": [
    {
      "trigger_data": "2",
      "filters": { "source_type": ["navigation"] }
    },
    {
      "trigger_data": "1",
      "filters": { "source_type": ["event"] }
    }
  ]
}
```

> [!NOTE]
> `"source_type"` là một trường được tự động điền và có sẵn trong `"filter_data"` của source.

> [!NOTE]
> `not_filters`, dùng để lọc theo phủ định, cũng được hỗ trợ.

Trong ngữ cảnh này, `filters` có thể là một đối tượng hoặc một mảng các đối tượng. Khi một danh sách được chỉ định, chỉ cần một dictionary khớp là trigger được xem là hợp lệ.

```json
{
  "event_trigger_data": [
    {
      "trigger_data": "2",
      "filters": [
        {
          "product": ["1234"],
          "conversion_subdomain": ["electronics.megastore"]
        },
        {
          "product": ["4321"],
          "conversion_subdomain": ["electronics4.megastore"]
        }
      ]
    }
  ]
}
```

Nếu các bộ lọc không khớp với bất kỳ event trigger nào, sẽ không có báo cáo cấp sự kiện nào được tạo. Nếu bộ lọc khớp với nhiều event trigger, event trigger khớp đầu tiên sẽ được dùng.

## Báo cáo gỡ lỗi

Bạn có thể bật báo cáo gỡ lỗi để nhận lại thông tin khắc phục sự cố về các báo cáo attribution của mình. Ví dụ, chúng có thể được dùng để kiểm tra việc thiết lập của bạn có hoạt động đúng không và hiểu các khoảng chênh lệch trong kết quả đo lường giữa triển khai cũ dựa trên cookie và triển khai Attribution Reporting mới. Báo cáo gỡ lỗi được gửi ngay lập tức; chúng không tuân theo cùng lịch gửi như báo cáo cấp sự kiện và báo cáo tóm tắt.

Có hai loại báo cáo gỡ lỗi khác nhau:

- **Báo cáo gỡ lỗi thành công** theo dõi việc tạo thành công một báo cáo attribution cụ thể. Báo cáo gỡ lỗi thành công được tạo và gửi ngay khi trigger tương ứng được đăng ký.
- **Báo cáo gỡ lỗi chi tiết** cung cấp cho bạn nhiều khả năng quan sát hơn đối với các sự kiện attribution source và attribution trigger liên quan đến một báo cáo attribution. Chúng cho phép bạn đảm bảo source đã được đăng ký thành công, hoặc theo dõi các báo cáo bị thiếu và xác định lý do bị thiếu (ví dụ do thất bại khi đăng ký sự kiện source hoặc trigger, hoặc thất bại khi gửi hay tạo báo cáo). Báo cáo gỡ lỗi chi tiết được gửi ngay khi source hoặc trigger được đăng ký.

> [!NOTE]
> Để dùng báo cáo gỡ lỗi, reporting origin cần đặt một cookie. Nếu origin được cấu hình để nhận báo cáo là bên thứ ba, cookie này sẽ là [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies), điều này có nghĩa là báo cáo gỡ lỗi sẽ không khả dụng trong các trình duyệt mà cookie bên thứ ba bị vô hiệu hóa hoặc không khả dụng.

### Sử dụng báo cáo gỡ lỗi

Để dùng báo cáo gỡ lỗi, bạn cần:

1. Đặt cookie `ar_debug` trên reporting origin của bạn. Cookie này cần hiện diện trong cả lúc đăng ký source lẫn trigger:

   ```http
   Set-Cookie: ar_debug=1; SameSite=None; Secure; Path=/; HttpOnly
   ```

2. Đặt trường `debug_key` trong bất kỳ header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}} và {{httpheader("Attribution-Reporting-Register-Trigger")}} nào liên quan đến các báo cáo attribution mà bạn muốn hiển thị thông tin gỡ lỗi. Mỗi giá trị `debug_key` phải là một số nguyên không dấu 64 bit được định dạng dưới dạng chuỗi cơ số 10. Hãy làm cho mỗi debug key là một ID duy nhất; ví dụ bạn có thể đặt mỗi khóa là Cookie ID + timestamp của source/trigger (và ghi lại cùng timestamp đó trong hệ thống cũ dựa trên cookie nếu bạn muốn so sánh hai hệ thống).

   ```json
   {
     "debug_key": "647775351539539"
   }
   ```

   > [!NOTE]
   > Hãy làm debug key phía source khác với `source_event_id`, để bạn có thể phân biệt từng báo cáo riêng lẻ có cùng source event ID.

3. Tùy chọn, đặt trường `debug_reporting` thành `true` trong cả hai header `Attribution-Reporting-Register-Source` và `Attribution-Reporting-Register-Trigger`. Nếu làm vậy, một báo cáo gỡ lỗi chi tiết sẽ được tạo. Nếu không làm vậy, một báo cáo gỡ lỗi thành công sẽ được tạo phản chiếu loại báo cáo attribution mà bạn đang tạo (cấp sự kiện hoặc có thể tổng hợp).

   ```json
   {
     "debug_key": "647775351539539",
     "debug_reporting": true
   }
   ```

4. Thiết lập các endpoint thích hợp để nhận các báo cáo gỡ lỗi mà bạn muốn tạo. Báo cáo gỡ lỗi được gửi tới ba endpoint riêng biệt trong reporting origin:
   - Endpoint cho báo cáo gỡ lỗi thành công cấp sự kiện: `<reporting-origin>/.well-known/attribution-reporting/debug/report-event-attribution`
   - Endpoint cho báo cáo gỡ lỗi thành công có thể tổng hợp: `<reporting-origin>/.well-known/attribution-reporting/debug/report-aggregate-attribution`
   - Endpoint cho báo cáo gỡ lỗi chi tiết: `<reporting-origin>/.well-known/attribution-reporting/debug/verbose`

Các báo cáo gỡ lỗi thành công được tạo ra giống hệt các báo cáo attribution, và chứa debug key phía source lẫn phía trigger trong các trường `"source_debug_key"` và `"trigger_debug_key"` tương ứng.

Để biết thêm thông tin và ví dụ, xem:

- [Introduction to debug reports](https://privacysandbox.google.com/private-advertising/attribution-reporting/attribution-reporting-debugging/) trên privacysandbox.google.com (2023)
- [Set up debug reports](https://privacysandbox.google.com/private-advertising/attribution-reporting/attribution-reporting-debugging/part-2/) trên privacysandbox.google.com (2023)
- [Debugging cookbook](https://privacysandbox.google.com/private-advertising/attribution-reporting/attribution-reporting-debugging/part-3/) trên privacysandbox.google.com (2023)
