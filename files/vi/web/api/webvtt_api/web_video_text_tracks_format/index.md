---
title: Định dạng Web Video Text Tracks (WebVTT)
slug: Web/API/WebVTT_API/Web_Video_Text_Tracks_Format
page-type: guide
browser-compat: html.elements.track
spec-urls: https://w3c.github.io/webvtt/
---

{{DefaultAPISidebar("WebVTT")}}

<!-- need to add info on region block -->

**Web Video Text Tracks Format** (**WebVTT**) là định dạng tệp văn bản thuần túy để hiển thị các text track có thời gian được đồng bộ hóa với nội dung trong các phần tử {{HTMLElement("video")}} và {{HTMLElement("audio")}}. Chúng có thể được sử dụng, ví dụ, để thêm văn bản chú thích kín và phụ đề chồng lên {{HTMLElement("video")}}.

Các tệp WebVTT được liên kết với phần tử phương tiện được thêm bằng phần tử {{HTMLElement("track")}} — xem [Displaying VTT content defined in a file](/en-US/docs/Web/API/WebVTT_API#displaying_vtt_content_defined_in_a_file). Một phần tử phương tiện có thể được liên kết với một số tệp, mỗi tệp đại diện cho các loại dữ liệu có thời gian khác nhau, chẳng hạn như chú thích kín, phụ đề hoặc tiêu đề chương.

> [!NOTE]
> Nội dung WebVTT cũng có thể được tạo và quản lý theo chương trình bằng cách sử dụng [WebVTT API](/en-US/docs/Web/API/WebVTT_API).

## Tổng quan

Các tệp WebVTT có loại MIME là `text/vtt` và phần mở rộng tệp `.vtt`. Nội dung phải được mã hóa bằng {{Glossary("UTF-8")}}.

Cấu trúc của WebVTT bao gồm các thành phần sau, một số là tùy chọn, theo thứ tự này:

- Tiêu đề, bao gồm dấu thứ tự byte tùy chọn (BOM) - chuỗi `WEBVTT` - theo sau là tiêu đề văn bản tùy chọn được phân tách bằng một hoặc nhiều ký tự khoảng trắng hoặc tab.
- Một hoặc nhiều dòng trống, mỗi dòng tương đương với hai dòng mới liên tiếp.
- Không hoặc nhiều khối `STYLE`, `REGION` hoặc `NOTE`, được phân tách bằng một hoặc nhiều dòng trống.
- Không hoặc nhiều khối cue hoặc `NOTE`, được phân tách bằng một hoặc nhiều dòng trống.

Ví dụ về tệp WebVTT đơn giản:

```plain
WEBVTT

NOTE This is a multi-line note block.
These are used for comments by the author
Two cue blocks are defined below.

00:01.000 --> 00:04.000
Never drink liquid nitrogen.

00:05.000 --> 00:09.000
Because:
- It will perforate your stomach.
- You could die.
```

## WebVTT Header

Các tệp WebVTT bắt đầu bằng khối tiêu đề chứa:

- Dấu thứ tự byte tùy chọn (BOM), là ký tự Unicode `U+FEFF`.
- Chuỗi `WEBVTT`.
- Tiêu đề văn bản tùy chọn ở bên phải `WEBVTT`.
  - Phải có ít nhất một khoảng trắng sau `WEBVTT`.
  - Bạn có thể sử dụng tiêu đề này để thêm mô tả vào tệp.
  - Bạn có thể sử dụng bất cứ điều gì trong tiêu đề văn bản ngoại trừ dòng mới hoặc chuỗi `-->`.

```plain
WEBVTT
```

```plain
WEBVTT This file has no cues.
```

## WebVTT cue

Một cue định nghĩa một chú thích, phụ đề hoặc khối văn bản khác được hiển thị trong một khoảng thời gian cụ thể. Các cue phải xuất hiện sau tiêu đề và bất kỳ khối `STYLE` hoặc `REGION` nào.

Mỗi cue bao gồm ba hoặc nhiều dòng hơn:

- Định danh cue tùy chọn theo sau là dòng mới.
- Thời gian cue cho biết khoảng thời gian khi văn bản payload nên được hiển thị.
- Văn bản payload cue, có thể trải qua nhiều dòng và sẽ được kết thúc bằng một dòng trống.

```plain
00:01.000 --> 00:04.000
Never drink liquid nitrogen.
```

```plain
1 - Title Crawl
00:05.000 --> 00:09.000 line:0 position:20% size:60% align:start
Because:
- It will perforate your stomach.
- You could die.
```

### Định danh cue

Định danh là tên xác định cue. Nó có thể được sử dụng để tham chiếu cue từ JavaScript hoặc CSS. Nó không được chứa dòng mới và không thể chứa chuỗi `-->`. Nó phải kết thúc bằng một dòng mới đơn.

```plain
WEBVTT

1
00:00:22.230 --> 00:00:24.606
This is the first subtitle.

2 Some Text
00:00:30.739 --> 00:00:34.074
This is the second.

3
00:00:34.159 --> 00:00:35.743
This is the third
```

### Thời gian cue

Thời gian cue cho biết khoảng thời gian khi cue được hiển thị. Nó có thời gian bắt đầu và kết thúc, được biểu diễn bằng dấu thời gian. Thời gian kết thúc phải lớn hơn thời gian bắt đầu.

Định dạng dấu thời gian:

- `mm:ss.ttt`
- `hh:mm:ss.ttt`

Ví dụ về thời gian cue cơ bản:

```plain
00:00:22.230 --> 00:00:24.606
00:00:30.739 --> 00:00:34.074
00:00:34.159 --> 00:00:35.743
00:00:35.827 --> 00:00:40.122
```

### Cài đặt cue

Cài đặt cue là các thành phần tùy chọn để định vị văn bản payload cue trên video. Có năm cài đặt cue có sẵn:

- `vertical`: Chỉ ra rằng văn bản sẽ được hiển thị theo chiều dọc.
- `line`: Chỉ định nơi văn bản xuất hiện theo chiều dọc (hoặc ngang nếu `vertical` được đặt).
- `position`: Chỉ định nơi văn bản sẽ xuất hiện theo chiều ngang (hoặc dọc nếu `vertical` được đặt).
- `size`: Chỉ định chiều rộng của vùng văn bản (hoặc chiều cao nếu `vertical` được đặt).
- `align`: Chỉ định căn chỉnh của văn bản.

Ví dụ:

```plain
00:00:05.000 --> 00:00:10.000
00:00:05.000 --> 00:00:10.000 line:63% position:72% align:start
00:00:05.000 --> 00:00:10.000 line:0 position:20% size:60% align:start
00:00:05.000 --> 00:00:10.000 vertical:rt line:-1 align:end
```

### Nội dung cue

Nội dung là nơi nội dung cue được định nghĩa, chẳng hạn như văn bản phụ đề hoặc chú thích kín.

Văn bản cue không thể chứa chuỗi `-->`, ký tự dấu và (`&`), hoặc dấu nhỏ hơn (`<`). Thay vào đó, hãy sử dụng tham chiếu ký tự như `&amp;` cho dấu và và `&lt;` cho dấu nhỏ hơn.

### Thẻ văn bản nội dung cue

Một số thẻ, chẳng hạn như `<b>`, có thể được sử dụng để đánh dấu và tạo kiểu văn bản trong cue.

- Thẻ dấu thời gian: Được sử dụng để bật chú thích kiểu karaoke.
- Thẻ in nghiêng (`<i></i>`): In nghiêng văn bản chứa.
- Thẻ in đậm (`<b></b>`): In đậm văn bản chứa.
- Thẻ gạch chân (`<u></u>`): Gạch chân văn bản chứa.
- Thẻ class (`<c></c>`): Thêm class vào văn bản chứa để chọn qua CSS.
- Thẻ ruby (`<ruby></ruby>`): Được sử dụng với thẻ văn bản ruby để hiển thị ký tự ruby.
- Thẻ văn bản ruby (`<rt></rt>`): Được sử dụng với thẻ ruby để hiển thị ký tự ruby.
- Thẻ giọng (`<v></v>`): Tương tự thẻ class, cũng được sử dụng để tạo kiểu văn bản chứa bằng CSS.
- Thẻ lang (`<lang></lang>`): Được sử dụng để đánh dấu văn bản thuộc về ngôn ngữ cụ thể.

## Khối NOTE

Khối NOTE là các phần tùy chọn có thể được sử dụng để thêm nhận xét vào tệp WebVTT. Chúng dành cho những người đọc tệp và không được người dùng nhìn thấy.

```plain
NOTE This is a single line comment

NOTE
This is a simple multi line comment

NOTE TODO I might add a line to indicate work that still has to be done.
```

## Khối STYLE

Khối `STYLE` là các phần tùy chọn có thể được sử dụng để nhúng kiểu CSS cho các cue trong tệp WebVTT.

```plain
WEBVTT

STYLE
::cue {
  background-image: linear-gradient(to bottom, dimgray, lightgray);
  color: papayawhip;
}

STYLE
::cue(b) {
  color: peachpuff;
}

00:00:00.000 --> 00:00:10.000
- Hello <b>world</b>.
```

### Khớp tất cả văn bản payload cue

```plain
STYLE
::cue {
  color: yellow;
}
```

### Khớp theo loại thẻ

```plain
STYLE
::cue(c),
::cue(i),
::cue(b),
::cue(u),
::cue(ruby),
::cue(rt),
::cue(v) {
  color: red;
}
::cue(lang) {
  color: yellow;
}
```

### Khớp theo bộ chọn class

```plain
WEBVTT

STYLE
::cue(.myclass) {
  color: yellow;
}

00:00:00.000 --> 00:00:08.000
<c.myclass>Yellow!</c>
<i.myclass>Yellow!</i>
<u.myclass>Yellow!</u>
<b.myclass>Yellow!</b>
```

### Khớp theo thuộc tính

```plain
WEBVTT

STYLE
::cue([lang="en-US"]) {
color: yellow;
}
::cue(lang[lang="en-GB"]) {
color: cyan;
}
::cue(v[voice="Salame"]) {
color: lime;
}

00:00:00.000 --> 00:00:08.000
Yellow!

00:00:08.000 --> 00:00:16.000
<lang en-GB>Cyan!</lang>

00:00:16.000 --> 00:00:24.000
I like <v Salame>lime.</v>
```

### Khớp bằng lớp giả

```plain
STYLE
::cue(:lang(en)) {
  color: yellow;
}
::cue(:lang(en-GB)) {
  color: cyan;
}
```

```css
video::cue(:past) {
  color: yellow;
}
video::cue(:future) {
  color: cyan;
}
```

### Khớp id cue

```plain
WEBVTT

STYLE ::cue(#cue1) {
  color: green;
}

cue1
00:00:00.000 --> 00:00:08.000
Green!
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả CSS [`::cue` và `::cue()`](/en-US/docs/Web/CSS/Reference/Selectors/::cue)
