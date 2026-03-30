---
title: Danh sách
slug: Learn_web_development/Core/Structuring_content/Lists
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Emphasis_and_importance", "Learn_web_development/Core/Structuring_content/Test_your_skills/HTML_text_basics", "Learn_web_development/Core/Structuring_content")}}

Bây giờ hãy chuyển sự chú ý của chúng ta sang danh sách. Danh sách xuất hiện khắp nơi trong cuộc sống — từ danh sách mua sắm đến danh sách chỉ đường mà bạn theo dõi một cách vô thức để đến nhà mỗi ngày, đến danh sách hướng dẫn bạn đang làm theo trong các hướng dẫn này! Có thể không có gì đáng ngạc nhiên khi HTML có một bộ phần tử tiện lợi cho phép chúng ta định nghĩa các loại danh sách khác nhau. Trên web, chúng ta có ba loại danh sách: không có thứ tự, có thứ tự và danh sách mô tả. Bài học này cho bạn thấy cách sử dụng các loại khác nhau.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cấu trúc HTML cho ba loại danh sách — không có thứ tự, có thứ tự và mô tả.</li>
          <li>Cách sử dụng đúng cho từng loại danh sách.</li>
          <li>Các trường hợp sử dụng rộng hơn của danh sách, chẳng hạn như menu điều hướng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Danh sách không có thứ tự

Danh sách không có thứ tự được sử dụng để đánh dấu các danh sách các mục mà thứ tự của các mục không quan trọng. Hãy lấy danh sách mua sắm làm ví dụ:

```plain
milk
eggs
bread
hummus
```

Trong ví dụ này, các mục có thể theo bất kỳ thứ tự nào. Để tạo danh sách này trong HTML, đầu tiên chúng ta bao bọc toàn bộ danh sách trong phần tử {{htmlelement("ul")}} (danh sách không có thứ tự).
Sau đó, chúng ta bao bọc từng mục trong phần tử {{htmlelement("li")}} (mục danh sách):

```html
<ul>
  <li>milk</li>
  <li>eggs</li>
  <li>bread</li>
  <li>hummus</li>
</ul>
```

### Đánh dấu danh sách không có thứ tự

Để cho bạn thực hành, chúng tôi muốn bạn thử đánh dấu danh sách trước đó:

1. Nhấp **"Play"** trong đầu ra mã được hiển thị bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Biến các mục văn bản riêng lẻ thành danh sách không có thứ tự.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn bị kẹt, hãy tham khảo lại đoạn mã trước đó.

```html hidden live-sample___lists_1
milk eggs bread hummus
```

{{ EmbedLiveSample('lists_1', "100%", 60) }}

## Danh sách có thứ tự

Danh sách có thứ tự là các danh sách trong đó thứ tự của các mục _có_ quan trọng. Hãy lấy một tập hợp các hướng dẫn làm ví dụ:

```plain
Drive to the end of the road
Turn right
Go straight across the first two roundabouts
Turn left at the third roundabout
The school is on your right, 300 meters up the road
```

Cấu trúc đánh dấu giống như cho danh sách không có thứ tự, ngoại trừ bạn phải bao bọc các mục danh sách trong phần tử {{htmlelement("ol")}}, thay vì `<ul>`:

```html
<ol>
  <li>Drive to the end of the road</li>
  <li>Turn right</li>
  <li>Go straight across the first two roundabouts</li>
  <li>Turn left at the third roundabout</li>
  <li>The school is on your right, 300 meters up the road</li>
</ol>
```

### Đánh dấu danh sách có thứ tự

Đến lúc thực hành nữa! Giống như nhiệm vụ trước, chúng tôi muốn bạn thử đánh dấu danh sách có thứ tự trước đó.

1. Nhấp **"Play"** trong đầu ra mã được hiển thị bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Biến các mục văn bản riêng lẻ thành danh sách có thứ tự.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn bị kẹt, hãy tham khảo lại đoạn mã trước đó.

```html hidden live-sample___lists_2
Drive to the end of the road Turn right Go straight across the first two
roundabouts Turn left at the third roundabout The school is on your right, 300
meters up the road
```

{{ EmbedLiveSample('lists_2', "100%", 60) }}

## Đánh dấu trang công thức nấu ăn của chúng ta

Bây giờ là một thử thách thực sự! Tại thời điểm này trong bài viết, bạn có tất cả thông tin cần thiết để đánh dấu một phần nội dung hơi phức tạp hơn. Chúng tôi muốn bạn đánh dấu các hướng dẫn cho công thức hummus yêu thích của chúng tôi.

Bạn có thể chọn:

- Lưu bản sao cục bộ của tệp bắt đầu [text-start.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/html-text-formatting/text-start.html) và thực hiện công việc trong trình soạn thảo mã của bạn.
- Nhấp **"Play"** trong đầu ra mã được hiển thị bên dưới để chỉnh sửa ví dụ trong MDN Playground.

Các hướng dẫn bạn cần làm theo là:

1. Đánh dấu tiêu đề trang chính bằng phần tử `<h1>` và ba tiêu đề phụ bằng các phần tử `<h2>`.
2. Có năm dòng văn bản có ý nghĩa khi được đánh dấu bằng các phần tử `<p>`. Hãy thực hiện ngay bây giờ.
3. Đánh dấu danh sách thành phần như một danh sách không có thứ tự.
4. Đánh dấu danh sách hướng dẫn như một danh sách có thứ tự.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới đầu ra mã.

```html-nolint live-sample___lists_3
Quick hummus recipe

This recipe makes quick, tasty hummus, with no messing. It has been adapted from a number of different recipes that I have read over the years.

Hummus is a delicious thick paste used heavily in Greek and Middle Eastern dishes. It is very tasty with salad, grilled meats and pitta breads.

Ingredients

1 can (400g) of chick peas (garbanzo beans)
175g of tahini
6 sundried tomatoes
Half a red pepper
A pinch of cayenne pepper
1 clove of garlic
A dash of olive oil

Instructions

Remove the skin from the garlic, and chop coarsely
Remove all the seeds and stalk from the pepper, and chop coarsely
Add all the ingredients into a food processor
Process all the ingredients into a paste
If you want a coarse "chunky" hummus, process it for a short time
If you want a smooth hummus, process it for a longer time

For a different flavor, you could try blending in a small measure of lemon and coriander, chili pepper, lime and chipotle, harissa and mint, or spinach and feta cheese. Experiment and see what works for you.

Storage

Refrigerate the finished hummus in a sealed container. You should be able to use it for about a week after you've made it. If it starts to become fizzy, you should definitely discard it.

Hummus is suitable for freezing; you should thaw it and use it within a couple of months.
```

{{ EmbedLiveSample('lists_3', "100%", 260) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

Bạn có thể tìm thấy ví dụ về HTML đúng cho ví dụ này tại [text-complete.html](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/html-text-formatting/text-complete.html) trong kho GitHub của chúng tôi.

</details>

## Lồng danh sách

Hoàn toàn có thể lồng một danh sách vào trong một danh sách khác. Bạn có thể muốn có một số gạch đầu dòng phụ nằm bên dưới một gạch đầu dòng cấp cao nhất. Hãy lấy danh sách thứ hai từ ví dụ công thức của chúng ta:

```html
<ol>
  <li>Remove the skin from the garlic, and chop coarsely.</li>
  <li>Remove all the seeds and stalk from the pepper, and chop coarsely.</li>
  <li>Add all the ingredients into a food processor.</li>
  <li>Process all the ingredients into a paste.</li>
  <li>If you want a coarse "chunky" hummus, process it for a short time.</li>
  <li>If you want a smooth hummus, process it for a longer time.</li>
</ol>
```

Vì hai gạch đầu dòng cuối liên quan chặt chẽ với gạch đầu dòng trước chúng (chúng đọc như các hướng dẫn phụ hoặc các lựa chọn phù hợp bên dưới gạch đầu dòng đó), có thể có ý nghĩa khi lồng chúng vào trong danh sách không có thứ tự riêng của chúng và đặt danh sách đó vào trong gạch đầu dòng thứ tư hiện tại. Điều này sẽ trông như sau:

```html
<ol>
  <li>Remove the skin from the garlic, and chop coarsely.</li>
  <li>Remove all the seeds and stalk from the pepper, and chop coarsely.</li>
  <li>Add all the ingredients into a food processor.</li>
  <li>
    Process all the ingredients into a paste.
    <ul>
      <li>
        If you want a coarse "chunky" hummus, process it for a short time.
      </li>
      <li>If you want a smooth hummus, process it for a longer time.</li>
    </ul>
  </li>
</ol>
```

Hãy thử quay lại nhiệm vụ trước và cập nhật danh sách thứ hai như thế này.

## Danh sách mô tả

Mục đích của danh sách mô tả là đánh dấu một tập hợp các mục và mô tả liên quan của chúng, chẳng hạn như các thuật ngữ và định nghĩa, hoặc câu hỏi và câu trả lời. Hãy xem một ví dụ về một tập hợp các thuật ngữ và định nghĩa:

```plain
soliloquy
In drama, where a character speaks to themselves, representing their inner thoughts or feelings and in the process relaying them to the audience (but not to other characters.)
monologue
In drama, where a character speaks their thoughts out loud to share them with the audience and any other characters present.
aside
In drama, where a character shares a comment only with the audience for humorous or dramatic effect. This is usually a feeling, thought or piece of additional background information
```

Danh sách mô tả sử dụng một vùng bao bọc khác với các loại danh sách khác — {{htmlelement("dl")}}; ngoài ra mỗi thuật ngữ được bao bọc trong phần tử {{htmlelement("dt")}} (thuật ngữ mô tả), và mỗi mô tả được bao bọc trong phần tử {{htmlelement("dd")}} (định nghĩa mô tả).

### Ví dụ danh sách mô tả

Hãy hoàn thành việc đánh dấu ví dụ của chúng ta:

```html
<dl>
  <dt>soliloquy</dt>
  <dd>
    In drama, where a character speaks to themselves, representing their inner
    thoughts or feelings and in the process relaying them to the audience (but
    not to other characters.)
  </dd>
  <dt>monologue</dt>
  <dd>
    In drama, where a character speaks their thoughts out loud to share them
    with the audience and any other characters present.
  </dd>
  <dt>aside</dt>
  <dd>
    In drama, where a character shares a comment only with the audience for
    humorous or dramatic effect. This is usually a feeling, thought, or piece of
    additional background information.
  </dd>
</dl>
```

Kiểu mặc định của trình duyệt sẽ hiển thị danh sách mô tả với các mô tả được thụt lề một chút so với các thuật ngữ.

{{EmbedLiveSample('Description_list_example', '100%', '285px')}}

### Nhiều mô tả cho một thuật ngữ

Lưu ý rằng có thể có một thuật ngữ duy nhất với nhiều mô tả, ví dụ:

```html
<dl>
  <dt>aside</dt>
  <dd>
    In drama, where a character shares a comment only with the audience for
    humorous or dramatic effect. This is usually a feeling, thought, or piece of
    additional background information.
  </dd>
  <dd>
    In writing, a section of content that is related to the current topic, but
    doesn't fit directly into the main flow of content so is presented nearby
    (often in a box off to the side.)
  </dd>
</dl>
```

{{EmbedLiveSample('Multiple_descriptions_for_one_term', '100%', '193px')}}

### Đánh dấu một tập hợp định nghĩa

Đây là lúc thử sức với việc đánh dấu danh sách mô tả:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Sử dụng các phần tử phù hợp để đánh dấu ba thuật ngữ và bốn mô tả trong nội dung. Hãy nhớ rằng thuật ngữ thứ ba có hai mô tả.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```html-nolint live-sample___lists_4
Love
The glue that binds the world together.
Eggs
The glue that binds the cake together.
Coffee
The drink that gets the world running in the morning.
A light brown color.
```

{{ EmbedLiveSample('lists_4', "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<dl>
  <dt>Love</dt>
  <dd>The glue that binds the world together.</dd>
  <dt>Eggs</dt>
  <dd>The glue that binds the cake together.</dd>
  <dt>Coffee</dt>
  <dd>The drink that gets the world running in the morning.</dd>
  <dd>A light brown color.</dd>
</dl>
```

</details>

## Tóm tắt

Đó là tất cả về danh sách. Tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về những kiến thức cơ bản về văn bản HTML.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Emphasis_and_importance", "Learn_web_development/Core/Structuring_content/Test_your_skills/HTML_text_basics", "Learn_web_development/Core/Structuring_content")}}
