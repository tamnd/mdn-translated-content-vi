---
title: Introduction to writing mode systems
short-title: Introduction
slug: Web/CSS/Guides/Writing_modes/Writing_mode_systems
page-type: guide
sidebar: cssref
---

CSS hỗ trợ các chiều hướng nội dung khác nhau, hay còn gọi là **writing mode**, bao gồm từ phải sang trái, từ trái sang phải, và từ trên xuống dưới. Hướng dẫn này cung cấp tổng quan ngắn gọn về các hệ thống writing mode và chiều hướng của chúng.

## Block và inline

Trước khi xem xét chiều hướng của các hệ thống chữ viết khác nhau, điều quan trọng là phải hiểu các thuật ngữ "block" và "inline". Thuật ngữ **inline** đề cập đến cách các ký tự và từ chảy trong một dòng. Thuật ngữ **block** đề cập đến cách các dòng hoặc khối nội dung xếp chồng lên nhau. Chế độ viết của tài liệu xác định hướng block và inline của tài liệu. Chúng không dựa trên hướng vật lý như trái, phải, trên và dưới.

### Chiều và hướng

Mọi thứ trên một trang web đều được bố trí theo chiều **inline** hoặc **block**. _Chiều inline_ là chiều dọc theo đó một dòng văn bản chạy trong writing mode hiện tại, trong khi _chiều block_ là chiều trong đó các block — như đoạn văn — hiển thị nối tiếp nhau. Chiều inline vuông góc với chiều block.

Trong một tài liệu tiếng Anh với văn bản chạy ngang từ trái sang phải, hoặc tài liệu tiếng Ả Rập với văn bản chạy ngang từ phải sang trái, chiều inline là ngang, trong khi _hướng inline_ lần lượt là từ trái sang phải và từ phải sang trái. Trong cả hai trường hợp, chiều block là dọc, với _hướng block_ là từ trên xuống dưới. Trong writing mode dọc như tiếng Nhật, chiều inline là dọc, vì các dòng trong writing mode đó chạy dọc, trong khi chiều block là ngang.

### Box inline và block

_Loại hiển thị ngoài_ của các box trong [normal flow layout](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#normal_flow) xác định cách box hoạt động bên cạnh các phần tử khác trên trang. _Inline box_ bao quanh từng dòng văn bản và được bố trí dọc theo chiều inline.

_Block box_ đại diện cho các container trên trang có thể chứa các phần tử block và inline khác. Chúng được bố trí dọc theo chiều block và sẽ mở rộng theo chiều inline để lấp đầy tất cả không gian có sẵn trong container của chúng (miễn là kích thước cụ thể không được đặt theo chiều inline bằng thuộc tính như {{cssxref("inline-size")}}). Block box chỉ được hiển thị từ trên xuống dưới của trang nếu bạn đang sử dụng writing mode hiển thị văn bản theo chiều ngang, như tiếng Anh.

Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values#properties) định nghĩa {{glossary("flow relative values", "các ánh xạ flow-relative")}} cho nhiều {{glossary("physical properties")}} và giá trị trong CSS, giúp hiểu các [khái niệm cơ bản về logical properties và values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts).

### Hướng cơ sở inline và hướng luồng block

_Hướng cơ sở inline_ là hướng chính trong đó nội dung được sắp xếp trên một dòng và xác định "bắt đầu" và "kết thúc" của dòng. Thuộc tính {{cssxref("direction")}} chỉ định hướng cơ sở inline của một box và, cùng với thuộc tính {{cssxref("unicode-bidi")}} và hướng vốn có của bất kỳ nội dung văn bản nào, xác định thứ tự của nội dung inline trong một dòng.

_Hướng luồng block_ là hướng trong đó các box cấp block và line box xếp chồng trong một block container. Thuộc tính {{cssxref("writing-mode")}} xác định hướng luồng block.

## Các chế độ hệ thống chữ viết

Các hệ thống chữ viết khác nhau có các writing mode khác nhau. Horizontal writing mode là writing mode với các dòng văn bản ngang, tức là luồng block hướng xuống dưới hoặc lên trên. Vertical writing mode là writing mode với các dòng văn bản dọc, tức là luồng block hướng sang trái hoặc phải.

Các hệ thống dựa trên Latin và Slavic thường được viết theo hướng inline từ trái sang phải với hướng luồng block từ trên xuống dưới. Các ngôn ngữ dựa trên Latin bao gồm tiếng Anh, Tây Ban Nha, Romania và Bồ Đào Nha. Các ngôn ngữ dựa trên Slavic bao gồm tiếng Ukraine, Ba Lan và Czech.

```html
<p lang="en-US" dir="auto">This is written in English</p>
<p lang="lt-LT" dir="auto">Tai parašyta lietuviu kalba</p>
<p lang="el-GR" dir="auto">Αυτό είναι γραμμένο στα ελληνικά</p>
```

Các hệ thống dựa trên Ả Rập thường được viết theo hướng inline từ phải sang trái với hướng luồng block từ trên xuống dưới. Có một số ngôn ngữ ngang từ phải sang trái, bao gồm tiếng Ả Rập, Aramaic, Azeri, Divehi, Fula, Hebrew, Kurdish, N'ko, Persian, Rohingya, Syriac và Urdu.

```html
<p lang="ur-PK" dir="auto">یہ اردو میں لکھا ہے۔</p>
<p lang="ku-CRB" dir="auto">ئەمە بە کوردی نووسراوە</p>
```

Các hệ thống dựa trên chữ Hán thường được viết theo hướng inline từ trái sang phải với hướng luồng block từ trên xuống dưới, hoặc theo hướng inline từ trên xuống dưới với hướng luồng block từ phải sang trái. Theo truyền thống, tiếng Trung Quốc, Việt Nam, Hàn Quốc và Nhật Bản được viết dọc theo cột, từ trên xuống dưới, với hướng block từ phải sang trái, nhưng thường được hiển thị theo chiều ngang trên mạng, từ trái sang phải.

```html
<p lang="ja-JP" dir="auto">これは日本語で書かれています</p>
```

Các hệ thống dựa trên chữ Mông Cổ thường được viết theo chiều dọc, từ trên xuống dưới, theo cột chảy từ trái sang phải; tức là hướng inline từ trên xuống dưới với hướng luồng block từ trái sang phải. Điều này khác với tiếng Trung Quốc, Nhật Bản và Hàn Quốc, có các cột văn bản dọc được đọc từ phải sang trái. Điều này xuất phát từ thực tế là chữ Mông Cổ có nguồn gốc từ chữ Old Uyghur, vốn được viết từ trái sang phải.

```html
<p lang="mn-MONG" dir="auto">Үүнийг монгол хэлээр бичжээ</p>
```

Để hiển thị các writing mode một cách chính xác, chúng ta sử dụng thuộc tính HTML toàn cục [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir). Vì trình duyệt có thể tắt tạo kiểu CSS, nên khuyến nghị sử dụng thuộc tính `dir` và phần tử {{htmlelement("bdo")}} để đảm bảo layout hai chiều chính xác khi không có stylesheet, thay vì thuộc tính CSS {{cssxref("direction")}}.

Đối với các ngôn ngữ dọc, chúng ta sử dụng các thuộc tính {{cssxref("writing-mode")}} và {{cssxref("text-orientation")}}:

```css
[lang|="ja"] {
  writing-mode: vertical-rl;
  text-orientation: upright;
}
[lang|="mn"] {
  writing-mode: vertical-lr;
  text-orientation: sideways;
}
```

{{EmbedLiveSample("Writing system modes", "100%", "500")}}

```css hidden
[lang|="ja"],
[lang|="mn"] {
  float: left;
}
```

## Kết hợp các writing mode

Mặc dù các ngôn ngữ khác nhau có các writing mode khác nhau, các trang web sử dụng chủ yếu một loại writing mode có thể chứa nội dung từ một ngôn ngữ hoặc writing mode khác. Ví dụ, các bài báo trên trang tin tức ngôn ngữ Ả Rập từ phải sang trái có thể bao gồm các số theo kiểu Latin, được viết từ trái sang phải. Nhiều tạp chí và báo kết hợp các writing mode khác nhau trên cùng một trang. Hướng dẫn này, minh họa các writing mode khác nhau, cũng làm vậy.

Chế độ kiểu chữ (typographic mode) xác định xem có sử dụng các quy ước kiểu chữ dành riêng cho luồng dọc đối với chữ viết dọc (chế độ kiểu chữ dọc) hay sử dụng các quy ước kiểu chữ của writing mode ngang (chế độ kiểu chữ ngang). Khái niệm này phân biệt sắp chữ dọc với sắp chữ ngang bị xoay.

Thành phần `text-orientation` của writing mode kiểm soát hướng glyph trong các chế độ kiểu chữ dọc, quyết định xem một đơn vị ký tự kiểu chữ cụ thể được sắp chữ thẳng đứng hay nằm ngang.

## Xem thêm

- Module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
