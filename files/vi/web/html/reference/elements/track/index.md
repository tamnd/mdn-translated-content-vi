---
title: "<track>: Phần tử Nhúng Rãnh Văn bản"
slug: Web/HTML/Reference/Elements/track
page-type: html-element
browser-compat: html.elements.track
sidebar: htmlsidebar
---

Phần tử **`<track>`** [HTML](/en-US/docs/Web/HTML) được sử dụng như là phần tử con của các phần tử media, {{HTMLElement("audio")}} và {{HTMLElement("video")}}.
Mỗi phần tử track cho phép bạn chỉ định một rãnh văn bản có thời gian (hoặc dữ liệu dựa trên thời gian) có thể được hiển thị song song với phần tử media, ví dụ để phủ lên phụ đề hoặc chú thích kín trên đầu video hoặc kèm theo các rãnh âm thanh.

Có thể chỉ định nhiều rãnh cho một phần tử media, chứa các loại dữ liệu văn bản có thời gian khác nhau, hoặc dữ liệu văn bản có thời gian đã được dịch cho các ngôn ngữ khác nhau.
Dữ liệu được sử dụng sẽ là rãnh đã được đặt là mặc định, hoặc là loại và bản dịch dựa trên tùy chọn của người dùng.

Các rãnh được định dạng theo [định dạng WebVTT](/en-US/docs/Web/API/WebVTT_API) (tệp `.vtt`) — Web Video Text Tracks.

{{InteractiveExample("HTML Demo: &lt;track&gt;", "tabbed-standard")}}

```html interactive-example
<video controls src="/shared-assets/videos/friday.mp4">
  <track
    default
    kind="captions"
    srclang="en"
    label="English"
    src="/shared-assets/misc/friday.vtt" />
  Download the
  <a href="/shared-assets/videos/friday.mp4">MP4</a>
  video, and
  <a href="/shared-assets/misc/friday.vtt">subtitles</a>.
</video>
```

```css interactive-example
video {
  width: 250px;
}

video::cue {
  font-size: 1rem;
}
```

## Thuộc tính

Phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `default`
  - : Thuộc tính này chỉ định rằng rãnh nên được bật trừ khi tùy chọn của người dùng chỉ định rằng rãnh khác phù hợp hơn. Thuộc tính này chỉ có thể được sử dụng trên một phần tử `track` trên mỗi phần tử media.
- `kind`
  - : Cách rãnh văn bản được sử dụng. Nếu bỏ qua, loại mặc định là `subtitles`. Nếu thuộc tính chứa giá trị không hợp lệ, nó sẽ sử dụng `metadata`.
    Các từ khóa được phép sau đây:
    - `subtitles`
      - : Phụ đề cung cấp bản ghi thoại hoặc dịch hội thoại. Chúng phù hợp khi âm thanh có sẵn nhưng không hiểu được, chẳng hạn lời nói hoặc văn bản không phải tiếng Anh trong phim tiếng Anh. Phụ đề có thể chứa nội dung bổ sung, thường là thông tin nền bổ sung. Ví dụ như văn bản ở đầu phim Star Wars, hoặc ngày, giờ, và địa điểm của một cảnh. Thông tin phụ đề bổ sung cho âm thanh và video. Nó thường được nhúng vào trong video, nhưng cũng có thể được cung cấp riêng, đặc biệt cho các bản dịch toàn bộ phim.
    - `captions`
      - : Chú thích kín cung cấp bản ghi thoại hoặc dịch hội thoại, hiệu ứng âm thanh, gợi ý âm nhạc liên quan, và thông tin âm thanh liên quan khác, chẳng hạn như nguồn của gợi ý (ví dụ: nhân vật, môi trường). Chúng phù hợp khi âm thanh không có sẵn hoặc không nghe rõ (ví dụ: vì nó bị tắt tiếng, bị âm thanh xung quanh che lấp, hoặc vì người dùng bị điếc).
    - `descriptions`
      - : Mô tả tóm tắt thành phần _video_ của tài nguyên media. Chúng được dự định để tổng hợp thành âm thanh khi thành phần trực quan bị che khuất, không có sẵn, hoặc không thể sử dụng (ví dụ: vì người dùng đang tương tác với ứng dụng mà không có màn hình khi lái xe, hoặc vì người dùng bị mù).
    - `chapters`
      - : Tiêu đề chương được dự định sử dụng khi người dùng điều hướng tài nguyên media.
    - `metadata`
      - : Rãnh được sử dụng bởi script. Không hiển thị cho người dùng.

- `label`
  - : Tiêu đề rãnh văn bản mà người dùng có thể đọc được, được trình duyệt sử dụng khi liệt kê các rãnh văn bản có sẵn.
- `src`
  - : Địa chỉ của rãnh (tệp `.vtt`). Phải là URL hợp lệ. Thuộc tính này phải được chỉ định và giá trị URL của nó phải có cùng nguồn gốc với tài liệu — trừ khi phần tử cha {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}} của phần tử `track` có thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin).
- `srclang`
  - : Ngôn ngữ của dữ liệu văn bản rãnh. Phải là {{glossary("BCP 47 language tag")}} hợp lệ. Nếu thuộc tính `kind` được đặt thành `subtitles`, thì `srclang` phải được xác định.

## Ghi chú sử dụng

### Các loại dữ liệu rãnh

Loại dữ liệu mà `track` thêm vào media được đặt trong thuộc tính `kind`, có thể nhận các giá trị `subtitles`, `captions`, `chapters` hoặc `metadata`. Phần tử trỏ đến tệp nguồn chứa văn bản có thời gian mà trình duyệt hiển thị khi người dùng yêu cầu dữ liệu bổ sung.

Phần tử media không thể có nhiều hơn một `track` có cùng `kind`, `srclang`, và `label`.

### Phát hiện thay đổi cue

{{domxref("TextTrack")}} cơ bản, được chỉ bởi thuộc tính {{domxref("HTMLTrackElement.track", "track")}}, nhận sự kiện `cuechange` mỗi khi cue đang được trình bày hiện tại thay đổi. Điều này xảy ra ngay cả khi rãnh không được liên kết với phần tử media.

Nếu rãnh _được_ liên kết với phần tử media, sử dụng phần tử `<track>` như là phần tử con của phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, sự kiện `cuechange` cũng được gửi đến {{domxref("HTMLTrackElement")}}.

```js
let textTrackElem = document.getElementById("text-track");

textTrackElem.addEventListener("cuechange", (event) => {
  let cues = event.target.track.activeCues;
});
```

### Thêm rãnh văn bản theo chương trình

Giao diện JavaScript đại diện cho phần tử `<track>` là {{domxref("HTMLTrackElement")}}.
Rãnh văn bản được liên kết với phần tử có thể được lấy từ thuộc tính {{domxref("HTMLTrackElement.track")}}, và có kiểu {{domxref("TextTrack")}}.

Các đối tượng `TextTrack` cũng có thể được thêm vào các phần tử {{domxref("HTMLVideoElement")}} hoặc {{domxref("HTMLAudioElement")}} bằng phương thức {{domxref("HTMLMediaElement.addTextTrack()")}}.
Các đối tượng `TextTrack` được liên kết với phần tử media được lưu trong {{domxref("TextTrackList")}}, có thể được truy xuất bằng thuộc tính {{domxref("HTMLMediaElement.textTracks")}}.

## Ví dụ

```html
<video controls poster="/images/sample.gif">
  <source src="sample.mp4" type="video/mp4" />
  <source src="sample.ogv" type="video/ogv" />
  <track kind="captions" src="sampleCaptions.vtt" srclang="en" />
  <track kind="chapters" src="sampleChapters.vtt" srclang="en" />
  <track kind="subtitles" src="sampleSubtitles_de.vtt" srclang="de" />
  <track kind="subtitles" src="sampleSubtitles_en.vtt" srclang="en" />
  <track kind="subtitles" src="sampleSubtitles_ja.vtt" srclang="ja" />
  <track kind="subtitles" src="sampleSubtitles_oz.vtt" srclang="oz" />
  <track kind="metadata" src="keyStage1.vtt" srclang="en" label="Key Stage 1" />
  <track kind="metadata" src="keyStage2.vtt" srclang="en" label="Key Stage 2" />
  <track kind="metadata" src="keyStage3.vtt" srclang="en" label="Key Stage 3" />
  <!-- Fallback -->
  …
</video>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>Không có</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là một {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        <p>
          Phần tử media, {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTrackElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Định dạng rãnh văn bản video web (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- {{domxref("HTMLMediaElement.textTracks")}}
