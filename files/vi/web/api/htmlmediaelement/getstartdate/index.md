---
title: "HTMLMediaElement: phương thức getStartDate()"
short-title: getStartDate()
slug: Web/API/HTMLMediaElement/getStartDate
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.getStartDate
---

{{APIRef("HTML DOM")}}

Phương thức **`getStartDate()`** của giao diện {{domxref("HTMLMediaElement")}} trả về một đối tượng {{jsxref("Date")}} mới biểu thị ngày và giờ trong thế giới thực tương ứng với thời điểm bắt đầu của phương tiện.

Điều này hữu ích cho các luồng phương tiện được gắn với đồng hồ trong thế giới thực, chẳng hạn như chương trình phát sóng trực tiếp bắt đầu vào một ngày và giờ cụ thể. Đối với phương tiện không bao gồm thông tin ngày và giờ, đối tượng `Date` được trả về sẽ có giá trị thời gian là {{jsxref("NaN")}}.

## Cú pháp

```js-nolint
getStartDate()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng {{jsxref("Date")}} thể hiện ngày và giờ bắt đầu của phương tiện. Nếu phương tiện không bao gồm thông tin ngày và giờ, đối tượng `Date` được trả về sẽ có giá trị thời gian là `NaN`.

## Sự miêu tả

Trong nội bộ, mỗi phần tử phương tiện theo dõi ngày bắt đầu, bắt đầu bằng `NaN` (chưa được đặt). Sau khi trình duyệt đã tải đủ dữ liệu để đọc siêu dữ liệu của phương tiện, trình duyệt sẽ đặt ngày bắt đầu thành thời gian trong thế giới thực tương ứng với thời điểm bắt đầu của phương tiện — nếu định dạng cung cấp một dữ liệu như vậy. Nếu không, ngày bắt đầu vẫn là `NaN`.

Đối với phương tiện chỉ định ngày và giờ bắt đầu (ví dụ: chương trình truyền hình trực tiếp được phát trực tuyến trên web), `getStartDate()` trả về đối tượng `Date` tương ứng với thời gian trong thế giới thực mà phương tiện bắt đầu. Điều này cho phép các điều khiển trình phát đa phương tiện hiển thị thời gian tuyệt đối (chẳng hạn như "2:30 chiều") thay vì thời gian tương ứng với thời điểm bắt đầu phát lại (chẳng hạn như "3 giờ, 12 phút").

`Date` được trả về sẽ có giá trị thời gian là `NaN` (biến nó thành [invalid date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date)) trong một trong các trường hợp sau:

- Chưa có dữ liệu nào được tải ({{domxref("HTMLMediaElement.readyState", "readyState")}} là `HAVE_NOTHING` nên chưa ấn định ngày bắt đầu.
- Định dạng phương tiện không bao gồm thông tin ngày và giờ.

Ngày bắt đầu không được đảm bảo sẽ có ngay khi sự kiện {{domxref("HTMLMediaElement/loadedmetadata_event", "loadedmetadata")}} diễn ra. Ví dụ: các luồng [HLS](https://developer.apple.com/documentation/http-live-streaming) mang ngày trong các thẻ `#EXT-X-PROGRAM-DATE-TIME` cấp phân khúc mà có thể chưa được đọc tại thời điểm đó. Thay vào đó, việc nghe sự kiện {{domxref("HTMLMediaElement/loadeddata_event", "loadeddata")}} đáng tin cậy hơn ở nhiều định dạng vì lúc đó trình duyệt đã tải đủ dữ liệu để xác định ngày bắt đầu.

## Ví dụ

### Hiển thị ngày bắt đầu của luồng trực tiếp

Ví dụ này truy xuất ngày bắt đầu của luồng trực tiếp — ngày và giờ trong thế giới thực mà chương trình phát sóng bắt đầu, do máy chủ nhúng vào luồng đó — và hiển thị ngày đó. Nó lắng nghe sự kiện {{domxref("HTMLMediaElement/loadeddata_event", "loadeddata")}}, sự kiện này sẽ kích hoạt sau khi đã tải đủ dữ liệu cho ngày bắt đầu.

#### HTML

```html
<video src="livestream.m3u8" controls></video>
<output>Start date: loading…</output>
```

#### Javascript

```js
const video = document.querySelector("video");
const display = document.querySelector("output");

video.addEventListener("loadeddata", () => {
  const startDate = video.getStartDate();

  if (isNaN(startDate.getTime())) {
    display.textContent = "Start date: not available";
  } else {
    display.textContent = `Start date: ${startDate.toLocaleString()}`;
  }
});
```

#### Kết quả

Đầu ra bên dưới hiển thị ngày bắt đầu của phương tiện do máy chủ cung cấp.
Lưu ý rằng điều này được mã hóa trong siêu dữ liệu mẫu ở [stream.m3u8](https://github.com/mdn/dom-examples/blob/main/media/getstartdate/stream.m3u8).

{{EmbedGHLiveSample("dom-examples/media/getstartdate/", '100%', 400)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}
- {{domxref("HTMLMediaElement.currentTime")}}
- {{domxref("HTMLMediaElement.duration")}}
