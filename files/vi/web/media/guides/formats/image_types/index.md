---
title: Hướng dẫn định dạng và kiểu tệp ảnh
slug: Web/Media/Guides/Formats/Image_types
page-type: guide
sidebar: mediasidebar
---

Trong hướng dẫn này, chúng ta sẽ tìm hiểu các kiểu tệp ảnh thường được trình duyệt web hỗ trợ, đồng thời đưa ra những gợi ý giúp bạn chọn định dạng phù hợp nhất cho hình ảnh trên trang web của mình.

## Các kiểu tệp ảnh phổ biến

Các định dạng ảnh được dùng phổ biến nhất trên web được liệt kê bên dưới.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row">Viết tắt</th>
      <th scope="row">Định dạng tệp</th>
      <th scope="col">MIME type</th>
      <th scope="col">Phần mở rộng</th>
      <th scope="col">Tóm tắt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><a href="#apng_animated_portable_network_graphics">APNG</a></th>
      <th scope="row">Animated Portable Network Graphics</th>
      <td><code>image/apng</code></td>
      <td><code>.apng</code>, <code>.png</code></td>
      <td>Phù hợp cho ảnh động không mất dữ liệu. AVIF và WebP thường nén tốt hơn, nhưng hỗ trợ trình duyệt hẹp hơn.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#avif_image">AVIF</a></th>
      <th scope="row">AV1 Image File Format</th>
      <td><code>image/avif</code></td>
      <td><code>.avif</code></td>
      <td>Phù hợp cho ảnh tĩnh lẫn ảnh động nhờ hiệu năng cao và nén rất tốt. Nên có phương án dự phòng bằng <code>&lt;picture&gt;</code>.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#gif_graphics_interchange_format">GIF</a></th>
      <th scope="row">Graphics Interchange Format</th>
      <td><code>image/gif</code></td>
      <td><code>.gif</code></td>
      <td>Phù hợp cho ảnh cơ bản và ảnh động đơn giản, nhưng chất lượng nén kém hơn các định dạng mới.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#jpeg_joint_photographic_experts_group_image">JPEG</a></th>
      <th scope="row">Joint Photographic Expert Group image</th>
      <td><code>image/jpeg</code></td>
      <td><code>.jpg</code>, <code>.jpeg</code>, <code>.jfif</code>, <code>.pjpeg</code>, <code>.pjp</code></td>
      <td>Lựa chọn phổ biến nhất cho ảnh chụp dùng nén mất dữ liệu.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#png_portable_network_graphics">PNG</a></th>
      <th scope="row">Portable Network Graphics</th>
      <td><code>image/png</code></td>
      <td><code>.png</code></td>
      <td>Ưu tiên hơn JPEG khi cần tái tạo chính xác hoặc có độ trong suốt.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#svg_scalable_vector_graphics">SVG</a></th>
      <th scope="row">Scalable Vector Graphics</th>
      <td><code>image/svg+xml</code></td>
      <td><code>.svg</code></td>
      <td>Định dạng vector, lý tưởng cho biểu tượng, sơ đồ và giao diện cần co giãn tốt.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#webp_image">WebP</a></th>
      <th scope="row">Web Picture format</th>
      <td><code>image/webp</code></td>
      <td><code>.webp</code></td>
      <td>Lựa chọn rất tốt cho cả ảnh tĩnh và ảnh động, nén tốt hơn PNG và JPEG.</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Các định dạng cũ như PNG, JPEG và GIF có hiệu năng kém hơn các định dạng mới như WebP và AVIF, nhưng lại có hỗ trợ trình duyệt "truyền thống" rộng hơn. Các định dạng mới đang ngày càng phổ biến khi các trình duyệt không hỗ trợ chúng dần không còn nhiều thị phần.

Danh sách sau gồm các định dạng ảnh có thể xuất hiện trên web nhưng nên tránh dùng cho nội dung web, thường vì chúng không được hỗ trợ rộng rãi hoặc có lựa chọn thay thế tốt hơn.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row">Viết tắt</th>
      <th scope="row">Định dạng tệp</th>
      <th scope="col">MIME type</th>
      <th scope="col">Phần mở rộng</th>
      <th scope="col">Trình duyệt hỗ trợ</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row"><a href="#bmp_bitmap_file">BMP</a></th><th scope="row">Bitmap file</th><td><code>image/bmp</code></td><td><code>.bmp</code></td><td>Chrome, Edge, Firefox, IE, Opera, Safari</td></tr>
    <tr><th scope="row"><a href="#ico_microsoft_windows_icon">ICO</a></th><th scope="row">Microsoft Icon</th><td><code>image/x-icon</code></td><td><code>.ico</code>, <code>.cur</code></td><td>Chrome, Edge, Firefox, IE, Opera, Safari</td></tr>
    <tr><th scope="row"><a href="#tiff_tagged_image_file_format">TIFF</a></th><th scope="row">Tagged Image File Format</th><td><code>image/tiff</code></td><td><code>.tif</code>, <code>.tiff</code></td><td>Safari</td></tr>
  </tbody>
</table>

## Chi tiết kiểu tệp ảnh

Các phần sau cung cấp cái nhìn ngắn gọn về từng kiểu tệp ảnh được trình duyệt web hỗ trợ.

Trong các bảng bên dưới, thuật ngữ **bits per component** chỉ số bit dùng để biểu diễn từng thành phần màu.
Ví dụ, độ sâu màu RGB là 8 nghĩa là các thành phần đỏ, lục và lam đều được biểu diễn bằng giá trị 8 bit.
**Bit depth** là tổng số bit dùng để biểu diễn mỗi pixel trong bộ nhớ.

### APNG

APNG mở rộng chuẩn PNG để hỗ trợ ảnh động. Nó phù hợp cho các hoạt cảnh đơn giản, không cần đồng bộ với âm thanh hoặc các tác vụ khác, như chỉ báo tiến trình hay biểu tượng chờ.

### AVIF image

AVIF là định dạng mã nguồn mở, không bản quyền, dựa trên các luồng AV1 trong container HEIF. Nó cho chất lượng nén rất cao cho cả ảnh tĩnh lẫn ảnh động, hỗ trợ alpha, HDR, dải màu rộng và nén không mất dữ liệu.

AVIF không hỗ trợ progressive rendering, nên tệp phải tải xong rồi mới hiển thị được. Trong thực tế, điều này thường không phải vấn đề lớn vì tệp AVIF thường nhỏ hơn JPEG hoặc PNG tương đương.
Nên dùng dự phòng bằng WebP, JPEG hoặc PNG thông qua phần tử `<picture>`.

### BMP, GIF, JPEG, PNG, SVG, TIFF, WebP, XBM

Các định dạng này đều có mục đích sử dụng riêng:

- BMP và TIFF thường hợp với các tình huống đặc thù hơn là nội dung web thông thường.
- GIF vẫn hữu ích cho ảnh đơn giản và ảnh động cũ, nhưng thường kém hiệu quả hơn WebP hoặc APNG.
- JPEG phù hợp nhất với ảnh chụp.
- PNG phù hợp khi cần độ chính xác cao hoặc trong suốt.
- SVG là lựa chọn tốt nhất cho đồ họa vector.
- WebP thường là lựa chọn cân bằng tốt giữa kích thước và chất lượng.
- XBM là định dạng cũ, nên tránh dùng.

## Chọn định dạng ảnh

Việc chọn định dạng ảnh phù hợp thường dễ hơn video vì có ít lựa chọn hỗ trợ rộng rãi hơn, và mỗi định dạng thường có một nhóm trường hợp sử dụng riêng.

### Ảnh chụp

Ảnh chụp thường phù hợp với nén mất dữ liệu. JPEG và WebP là lựa chọn tốt; JPEG tương thích rộng hơn còn WebP thường nén tốt hơn.

### Biểu tượng

Với ảnh nhỏ như biểu tượng, nên dùng định dạng không mất dữ liệu. Nếu có thể, hãy ưu tiên SVG; nếu không, PNG là lựa chọn an toàn.

### Ảnh chụp màn hình

Nên dùng định dạng không mất dữ liệu, đặc biệt nếu ảnh có văn bản. PNG là lựa chọn an toàn; WebP không mất dữ liệu cũng rất tốt nếu bạn chấp nhận mức hỗ trợ trình duyệt thấp hơn.

### Sơ đồ, bản vẽ và biểu đồ

Nếu ảnh có thể biểu diễn bằng vector, SVG là lựa chọn tốt nhất. Nếu không, hãy dùng PNG.

## Cung cấp ảnh dự phòng

Phần tử HTML `img` không hỗ trợ phương án dự phòng theo kiểu compatibility fallback cho ảnh, nhưng phần tử `picture` thì có.
Bạn có thể đặt nhiều `source` bên trong `picture`, mỗi `source` trỏ đến một phiên bản ảnh ở định dạng khác nhau, rồi thêm một `img` làm phương án cuối cùng.

## Xem thêm

- [SVG](/en-US/docs/Web/SVG)
- [PNG Specification](https://w3c.github.io/png/)
- [WebP Specification](https://developers.google.com/speed/webp)
