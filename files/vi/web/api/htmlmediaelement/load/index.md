---
title: "HTMLMediaElement: phương thức load()"
short-title: load()
slug: Web/API/HTMLMediaElement/load
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.load
---

{{APIRef("HTML DOM")}}

Phương thức {{domxref("HTMLMediaElement")}}
**`load()`** đặt lại phần tử phương tiện về trạng thái ban đầu và
bắt đầu quá trình chọn nguồn phương tiện và tải phương tiện để chuẩn bị
để bắt đầu phát lại từ đầu.

Lượng dữ liệu truyền thông được
tìm nạp trước được xác định bởi giá trị thuộc tính [`preload`](/en-US/docs/Web/HTML/Reference/Elements/video#preload) của phần tử.

Phương pháp này thường chỉ hữu ích khi bạn thực hiện các thay đổi động đối với tập hợp
các nguồn có sẵn cho phần tử phương tiện, bằng cách thay đổi thuộc tính của phần tử
thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src) hoặc bằng cách thêm hoặc xóa
Các phần tử {{HTMLElement("source")}} được lồng trong chính phần tử phương tiện đó.
`load()` sẽ thiết lập lại phần tử và quét lại các nguồn có sẵn, từ đó
làm cho những thay đổi có hiệu lực.

## Cú pháp

```js-nolint
load()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ghi chú sử dụng

Việc gọi `load()` sẽ hủy bỏ tất cả các hoạt động đang diễn ra liên quan đến thành phần phương tiện này,
sau đó bắt đầu quá trình lựa chọn và tải tài nguyên phương tiện thích hợp dựa trên
các tùy chọn được chỉ định trong phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}
và thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src) hoặc thuộc tính con {{HTMLElement("source")}} của nó
(các) phần tử. Điều này được mô tả chi tiết hơn trong
trang [HTML video and audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio#using_multiple_source_formats_to_improve_compatibility).

Quá trình hủy bỏ mọi hoạt động đang diễn ra sẽ gây ra bất kỳ khoản nợ đọng nào
{{jsxref("Promise")}}s được trả về bởi {{domxref("HTMLMediaElement.play", "play()")}}
được đáp ứng hoặc bị từ chối tùy theo tình trạng của chúng trước khi nạp hàng mới
phương tiện truyền thông có thể bắt đầu. Lời hứa chơi đang chờ xử lý bị hủy bỏ bằng `"AbortError"`
{{domxref("DOMException")}}.

Các sự kiện phù hợp sẽ được gửi đến chính phần tử phương tiện dưới dạng quá trình tải
tiền thu được:

- Nếu phần tử đang trong quá trình tải phương tiện thì quá trình tải đó là
  bị hủy bỏ và sự kiện **{{domxref("HTMLMediaElement/abort_event", "abort")}}** được gửi đi.
- Nếu phần tử đã được khởi tạo bằng phương tiện, thì
  **{{domxref("HTMLMediaElement/emptied_event", "emptied")}}** sự kiện được gửi.
- Nếu việc đặt lại vị trí phát lại về đầu media thực sự thay đổi
  vị trí phát lại (nghĩa là nó chưa ở đầu), a
  **{{domxref("HTMLMediaElement/timeupdate_event", "timeupdate")}}** sự kiện được gửi.
- Khi phương tiện đã được chọn và quá trình tải sẵn sàng bắt đầu,
  Sự kiện **{{domxref("HTMLMediaElement/loadstart_event", "loadstart")}}** đã được thực hiện.
- Từ thời điểm này trở đi, các sự kiện sẽ được gửi giống như bất kỳ lượt tải phương tiện nào.

## Ví dụ

Ví dụ này tìm thấy phần tử {{HTMLElement("video")}} trong tài liệu và đặt lại nó bằng cách
đang gọi `load()`.

```js
const mediaElem = document.querySelector("video");
mediaElem.load();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
