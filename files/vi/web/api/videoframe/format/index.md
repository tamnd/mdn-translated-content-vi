---
title: "VideoFrame: format property"
short-title: format
slug: Web/API/VideoFrame/format
page-type: web-api-instance-property
browser-compat: api.VideoFrame.format
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`format`** của giao diện {{domxref("VideoFrame")}} trả về định dạng pixel của `VideoFrame`.

## Giá trị

Một chuỗi chứa định dạng pixel video, một trong các giá trị sau:

- `"I420"`
  - : Còn được gọi là _Planar YUV 4:2:0_, định dạng này gồm ba mặt phẳng riêng biệt: một mặt phẳng luma và hai mặt phẳng chroma, được ký hiệu là Y, U và V, theo thứ tự đó. Các mặt phẳng U và V được lấy mẫu con theo cả chiều ngang và dọc với hệ số 2 so với mặt phẳng Y. Mỗi mẫu trong định dạng này là 8 bit.
- `"I420P10"`
  - : Còn được gọi là _Planar YUV 4:2:0_ 10-bit, định dạng này gồm ba mặt phẳng riêng biệt: một mặt phẳng luma và hai mặt phẳng chroma, được ký hiệu là Y, U và V, theo thứ tự đó. Các mặt phẳng U và V được lấy mẫu con theo cả chiều ngang và dọc với hệ số 2 so với mặt phẳng Y. Mỗi mẫu trong định dạng này là 10 bit, được mã hóa dưới dạng số nguyên 16-bit theo thứ tự byte little-endian.
- `"I420P12"`
  - : Còn được gọi là _Planar YUV 4:2:0_ 12-bit, định dạng này gồm ba mặt phẳng riêng biệt: một mặt phẳng luma và hai mặt phẳng chroma, được ký hiệu là Y, U và V, theo thứ tự đó. Các mặt phẳng U và V được lấy mẫu con theo cả chiều ngang và dọc với hệ số 2 so với mặt phẳng Y. Mỗi mẫu trong định dạng này là 12 bit, được mã hóa dưới dạng số nguyên 16-bit theo thứ tự byte little-endian.
- `"I420A"`
  - : Còn được gọi là _Planar YUV 4:2:0 với kênh alpha_, định dạng này gồm bốn mặt phẳng riêng biệt: một mặt phẳng Luma, hai mặt phẳng Chroma, được ký hiệu là Y, U và V, và một mặt phẳng giá trị alpha, theo thứ tự đó. Các mặt phẳng U và V được lấy mẫu con theo cả chiều ngang và dọc với hệ số 2 so với các mặt phẳng Y và Alpha. Mỗi mẫu trong định dạng này là 8 bit.
- `"I422"`
  - : Còn được gọi là _Planar YUV 4:2:2_, định dạng này gồm ba mặt phẳng riêng biệt: một mặt phẳng Luma và hai mặt phẳng Chroma, được ký hiệu là Y, U và V, theo thứ tự đó. Các mặt phẳng U và V được lấy mẫu con theo chiều ngang với hệ số 2 so với mặt phẳng Y, và không lấy mẫu con theo chiều dọc. Mỗi mẫu trong định dạng này là 8 bit.
- `"I444"`
  - : Còn được gọi là _Planar YUV 4:4:4_, định dạng này gồm ba mặt phẳng riêng biệt: một mặt phẳng Luma và hai mặt phẳng Chroma, được ký hiệu là Y, U và V, theo thứ tự đó. Mỗi mẫu trong định dạng này là 8 bit. Định dạng này không sử dụng lấy mẫu con.
- `"NV12"`
  - : Định dạng này gồm hai mặt phẳng riêng biệt: một mặt phẳng Luma và sau đó một mặt phẳng khác cho hai thành phần Chroma. Hai mặt phẳng theo thứ tự đó và được gọi là mặt phẳng Y và mặt phẳng UV. Các thành phần U và V được lấy mẫu con theo cả chiều ngang và dọc với hệ số 2 so với các thành phần trong mặt phẳng Y. Mỗi mẫu trong định dạng này là 8 bit.
- `"RGBA"`
  - : Định dạng này gồm một mặt phẳng duy nhất, mã hóa bốn thành phần: đỏ, xanh lục, xanh lam, và giá trị alpha, theo thứ tự đó. Mỗi mẫu trong định dạng này là 8 bit, và mỗi pixel do đó là 32 bit.
- `"RGBX"`
  - : Định dạng này gồm một mặt phẳng duy nhất, mã hóa bốn thành phần: Đỏ, Xanh lục, Xanh lam, và giá trị đệm, theo thứ tự đó. Mỗi mẫu trong định dạng này là 8 bit. Phần tử thứ tư trong mỗi pixel sẽ bị bỏ qua, ảnh luôn hoàn toàn mờ đục.
- `"BGRA"`
  - : Định dạng này gồm một mặt phẳng duy nhất, mã hóa bốn thành phần: Xanh lam, Xanh lục, Đỏ, và giá trị alpha, theo thứ tự đó. Mỗi mẫu trong định dạng này là 8 bit.
- `"BGRX"`
  - : Định dạng này gồm một mặt phẳng duy nhất, mã hóa bốn thành phần: Xanh lam, Xanh lục, Đỏ, và giá trị đệm, theo thứ tự đó. Mỗi mẫu trong định dạng này là 8 bit. Phần tử thứ tư trong mỗi pixel sẽ bị bỏ qua, ảnh luôn hoàn toàn mờ đục.

## Ví dụ

Ví dụ sau in `format` ra console.

```js
console.log(VideoFrame.format);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
