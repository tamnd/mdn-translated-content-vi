---
title: "XMLHttpRequest: thuộc tính upload"
short-title: upload
slug: Web/API/XMLHttpRequest/upload
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.upload
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính `upload` {{domxref("XMLHttpRequest")}} trả về một đối tượng {{domxref("XMLHttpRequestUpload")}} có thể được quan sát để theo dõi tiến trình tải lên.

Đây là một đối tượng mờ, nhưng vì nó cũng là một {{domxref("XMLHttpRequestEventTarget")}}, các trình lắng nghe sự kiện có thể được gắn vào để theo dõi quá trình của nó.

> [!NOTE]
> Việc gắn các trình lắng nghe sự kiện vào đối tượng này ngăn yêu cầu trở thành "yêu cầu đơn giản" và sẽ gây ra một yêu cầu preflight được phát hành nếu xuyên nguồn gốc; xem [CORS](/en-US/docs/Web/HTTP/Guides/CORS). Vì lý do này, các trình lắng nghe sự kiện cần được đăng ký trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}} hoặc các sự kiện upload sẽ không được dispatch.

> [!NOTE]
> Đặc tả kỹ thuật cũng có vẻ chỉ ra rằng các trình lắng nghe sự kiện nên được gắn sau {{domxref("XMLHttpRequest.open", "open()")}}. Tuy nhiên, các trình duyệt có lỗi về vấn đề này, và thường cần các trình lắng nghe được đăng ký _trước_ {{domxref("XMLHttpRequest.open", "open()")}} để hoạt động.

Các sự kiện sau có thể được kích hoạt trên một đối tượng upload và được sử dụng để theo dõi quá trình tải lên:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Sự kiện</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/loadstart_event", "loadstart")}}</td>
      <td>Quá trình tải lên đã bắt đầu.</td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}</td>
      <td>
        Được phân phối định kỳ để cho biết lượng tiến trình đã đạt được cho đến nay.
      </td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}}</td>
      <td>Hoạt động tải lên đã bị hủy bỏ.</td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/error_event", "error")}}</td>
      <td>Quá trình tải lên thất bại do một lỗi.</td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/load_event", "load")}}</td>
      <td>Quá trình tải lên hoàn tất thành công.</td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/timeout_event", "timeout")}}</td>
      <td>
        Quá trình tải lên đã hết thời gian vì không có phản hồi trong khoảng thời gian được chỉ định bởi {{domxref("XMLHttpRequest.timeout")}}.
      </td>
    </tr>
    <tr>
      <td>{{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}}</td>
      <td>
        Quá trình tải lên đã kết thúc. Sự kiện này không phân biệt giữa thành công hay thất bại, và được gửi vào cuối quá trình tải lên bất kể kết quả. Trước sự kiện này, một trong các sự kiện <code>load</code>, <code>error</code>, <code>abort</code>, hoặc <code>timeout</code> sẽ đã được phân phối để cho biết lý do kết thúc tải lên.
      </td>
    </tr>
  </tbody>
</table>

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- {{domxref("XMLHttpRequestUpload")}}
