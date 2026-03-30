---
title: Thiết lập môi trường phát triển Django
short-title: Thiết lập môi trường phát triển
slug: Learn_web_development/Extensions/Server-side/Django/development_environment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Introduction", "Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Django")}}

Bây giờ khi bạn đã biết Django dùng để làm gì, chúng tôi sẽ chỉ cho bạn cách thiết lập và kiểm tra môi trường phát triển Django trên Windows, Linux (Ubuntu) và macOS — dù bạn đang sử dụng hệ điều hành phổ biến nào, bài viết này sẽ cung cấp cho bạn những gì bạn cần để bắt đầu phát triển ứng dụng Django.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về sử dụng terminal/command line và cách cài đặt các gói phần mềm trên hệ điều hành máy tính phát triển của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Có môi trường phát triển cho Django (4.*) đang chạy trên máy tính của bạn.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan về môi trường phát triển Django

Django giúp rất dễ dàng để thiết lập máy tính của riêng bạn để bạn có thể bắt đầu phát triển ứng dụng web. Phần này giải thích những gì bạn nhận được với môi trường phát triển, và cung cấp cái nhìn tổng quan về một số tùy chọn cài đặt và cấu hình của bạn. Phần còn lại của bài viết giải thích phương pháp _được khuyến nghị_ để cài đặt môi trường phát triển Django trên Ubuntu, macOS và Windows, và cách bạn có thể kiểm tra nó.

### Môi trường phát triển Django là gì?

Môi trường phát triển là một cài đặt Django trên máy tính cục bộ của bạn mà bạn có thể sử dụng để phát triển và kiểm tra ứng dụng Django trước khi triển khai chúng lên môi trường sản xuất.

Các công cụ chính mà Django cung cấp là một tập hợp các script Python để tạo và làm việc với các dự án Django, cùng với một _máy chủ web phát triển_ đơn giản mà bạn có thể sử dụng để kiểm tra các ứng dụng web Django cục bộ (tức là, trên máy tính của bạn, không phải trên máy chủ web bên ngoài) trên trình duyệt web của máy tính bạn.

Có các công cụ ngoại vi khác, thường là một phần của môi trường phát triển, mà chúng tôi sẽ không đề cập ở đây. Chúng bao gồm những thứ như [trình soạn thảo văn bản](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Available_text_editors) hoặc IDE để chỉnh sửa code, linter để tự động định dạng, v.v. Chúng tôi giả định rằng bạn đã cài đặt một trình soạn thảo văn bản.

### Các tùy chọn cài đặt Django là gì?

Django rất linh hoạt về cách thức và vị trí có thể được cài đặt và cấu hình. Django có thể:

- Được cài đặt trên các hệ điều hành khác nhau.
- Được cài đặt từ nguồn, từ Python Package Index (PyPi) và trong nhiều trường hợp từ ứng dụng trình quản lý gói của máy tính chủ.
- Được cấu hình để sử dụng một trong nhiều cơ sở dữ liệu, cũng có thể cần được cài đặt và cấu hình riêng.
- Chạy trong môi trường Python hệ thống chính hoặc trong các môi trường ảo Python riêng biệt.

Mỗi tùy chọn này yêu cầu cấu hình và cài đặt hơi khác nhau. Các phần phụ sau đây giải thích một số lựa chọn của bạn. Đối với phần còn lại của bài viết, chúng tôi sẽ chỉ cách thiết lập Django trên một số ít hệ điều hành, và cài đặt đó sẽ được giả định trong suốt phần còn lại của module này.

> [!NOTE]
> Các tùy chọn cài đặt khả thi khác được đề cập trong tài liệu Django chính thức. Chúng tôi liên kết đến [các tài liệu thích hợp dưới đây](#see_also).

#### Hệ điều hành nào được hỗ trợ?

Các ứng dụng web Django có thể chạy trên hầu hết mọi máy có thể chạy ngôn ngữ lập trình Python 3: Windows, macOS, Linux/Unix, Solaris, chỉ để kể một vài cái tên.
Hầu hết mọi máy tính đều có hiệu suất cần thiết để chạy Django trong quá trình phát triển.

Trong bài viết này, chúng tôi sẽ cung cấp hướng dẫn cho Windows, macOS và Linux/Unix.

#### Nên sử dụng phiên bản Python nào?

Bạn có thể sử dụng bất kỳ phiên bản Python nào được hỗ trợ bởi bản phát hành Django mục tiêu của bạn.
Đối với Django 5.0, các phiên bản được cho phép là Python 3.10 đến 3.12 (xem [FAQ:Installation](https://docs.djangoproject.com/en/5.0/faq/install/#what-python-version-can-i-use-with-django)).

Dự án Django _khuyến nghị_ (và "hỗ trợ chính thức") sử dụng phiên bản mới nhất có sẵn của bản phát hành Python được hỗ trợ.

#### Django có thể tải xuống ở đâu?

Có ba nơi để tải xuống Django:

- Python Package Repository (PyPi), sử dụng công cụ _pip_. Đây là cách tốt nhất để lấy phiên bản ổn định mới nhất của Django.
- Sử dụng phiên bản từ trình quản lý gói của máy tính bạn. Các bản phân phối Django được đóng gói với hệ điều hành cung cấp cơ chế cài đặt quen thuộc. Tuy nhiên, lưu ý rằng phiên bản được đóng gói có thể khá cũ, và chỉ có thể được cài đặt vào môi trường Python hệ thống (có thể không phải là những gì bạn muốn).
- Cài đặt từ nguồn. Bạn có thể lấy và cài đặt phiên bản mới nhất của Django từ nguồn. Điều này không được khuyến nghị cho người mới bắt đầu nhưng cần thiết khi bạn đã sẵn sàng bắt đầu đóng góp trở lại cho Django.

Bài viết này chỉ cách cài đặt Django từ PyPi, để lấy phiên bản ổn định mới nhất.

#### Cơ sở dữ liệu nào?

Django hỗ trợ chính thức các cơ sở dữ liệu PostgreSQL, MariaDB, MySQL, Oracle và SQLite, và có các thư viện cộng đồng cung cấp các mức độ hỗ trợ khác nhau cho các cơ sở dữ liệu SQL và NoSQL phổ biến khác. Chúng tôi khuyến nghị bạn chọn cùng một cơ sở dữ liệu cho cả môi trường sản xuất và phát triển (mặc dù Django trừu tượng hóa nhiều sự khác biệt của cơ sở dữ liệu bằng cách sử dụng Object-Relational Mapper (ORM) của nó, vẫn còn [các vấn đề tiềm ẩn](https://docs.djangoproject.com/en/5.0/ref/databases/) tốt hơn là nên tránh).

Đối với bài viết này (và hầu hết module này) chúng tôi sẽ sử dụng cơ sở dữ liệu _SQLite_, lưu trữ dữ liệu trong một tệp. SQLite được dự định sử dụng như một cơ sở dữ liệu nhẹ và không thể hỗ trợ mức độ truy cập đồng thời cao. Tuy nhiên, nó là lựa chọn tuyệt vời cho các ứng dụng chủ yếu là chỉ đọc.

> [!NOTE]
> Django được cấu hình để sử dụng SQLite theo mặc định khi bạn bắt đầu dự án website bằng các công cụ tiêu chuẩn (_django-admin_). Đây là lựa chọn tuyệt vời khi bạn bắt đầu vì nó không yêu cầu cấu hình hoặc thiết lập thêm.

#### Cài đặt toàn hệ thống hay trong môi trường ảo Python?

Khi bạn cài đặt Python3, bạn có được một môi trường toàn cục duy nhất được chia sẻ bởi tất cả code Python3. Mặc dù bạn có thể cài đặt bất kỳ gói Python nào bạn thích trong môi trường, bạn chỉ có thể cài đặt một phiên bản cụ thể của mỗi gói tại một thời điểm.

> [!NOTE]
> Các ứng dụng Python được cài đặt vào môi trường toàn cục có thể xung đột với nhau (tức là nếu chúng phụ thuộc vào các phiên bản khác nhau của cùng một gói).

Nếu bạn cài đặt Django vào môi trường mặc định/toàn cục thì bạn chỉ có thể nhắm mục tiêu một phiên bản Django trên máy tính. Đây có thể là vấn đề nếu bạn muốn tạo các website mới (sử dụng phiên bản Django mới nhất) trong khi vẫn duy trì các website dựa trên các phiên bản cũ hơn.

Do đó, các nhà phát triển Python/Django có kinh nghiệm thường chạy các ứng dụng Python trong _môi trường ảo Python_ độc lập. Điều này cho phép có nhiều môi trường Django khác nhau trên một máy tính. Nhóm nhà phát triển Django khuyến nghị bạn sử dụng môi trường ảo Python!

Module này giả định rằng bạn đã cài đặt Django vào môi trường ảo, và chúng tôi sẽ chỉ bạn cách làm điều đó dưới đây.

## Cài đặt Python 3

Để sử dụng Django bạn phải có Python 3 trên hệ điều hành của mình.
Bạn cũng sẽ cần công cụ [Python Package Index](https://pypi.org/) — _pip3_ — được sử dụng để quản lý (cài đặt, cập nhật và xóa) các gói/thư viện Python được sử dụng bởi Django và các ứng dụng Python khác của bạn.

Phần này giải thích ngắn gọn cách bạn có thể kiểm tra phiên bản Python nào có mặt, và cài đặt các phiên bản mới khi cần, cho Ubuntu Linux 20.04, macOS và Windows 10.

> [!NOTE]
> Tùy thuộc vào nền tảng của bạn, bạn cũng có thể cài đặt Python/pip từ trình quản lý gói riêng của hệ điều hành hoặc qua các cơ chế khác. Đối với hầu hết các nền tảng, bạn có thể tải các tệp cài đặt cần thiết từ <https://www.python.org/downloads/> và cài đặt chúng bằng phương thức phù hợp với từng nền tảng.

### Ubuntu 22.04

Ubuntu Linux 22.04 LTS bao gồm Python 3.10.12 theo mặc định.
Bạn có thể xác nhận điều này bằng cách chạy lệnh sau trong terminal bash:

```bash
python3 -V
# Output: Python 3.10.12
```

Tuy nhiên, công cụ Python Package Index (_pip3_) bạn cần để cài đặt các gói cho Python 3 (bao gồm Django) **không** có sẵn theo mặc định.
Bạn có thể cài đặt _pip3_ trong terminal bash bằng cách:

```bash
sudo apt install python3-pip
```

> [!NOTE]
> Python 3.10 là phiên bản cũ nhất [được Django 5.0 hỗ trợ](https://docs.djangoproject.com/en/5.0/faq/install/#what-python-version-can-i-use-with-django).
> Bạn không _cần_ sử dụng phiên bản Python mới nhất cho hướng dẫn này, nhưng nếu bạn muốn có hướng dẫn trên internet.

### macOS

macOS không bao gồm Python 3 theo mặc định (Python 2 được bao gồm trên các phiên bản cũ hơn).
Bạn có thể xác nhận điều này bằng cách chạy lệnh sau trong terminal:

```bash
python3 -V
```

Lệnh này sẽ hiển thị số phiên bản Python, cho biết Python 3 đã được cài đặt, hoặc `python3: command not found`, cho biết Python 3 không được tìm thấy.

Bạn có thể dễ dàng cài đặt Python 3 (cùng với công cụ _pip3_) từ [python.org](https://www.python.org/):

1. Tải xuống trình cài đặt cần thiết:
   1. Truy cập <https://www.python.org/downloads/macos/>
   2. Tải xuống bản phát hành ổn định của [phiên bản được hỗ trợ](https://docs.djangoproject.com/en/5.0/faq/install/#what-python-version-can-i-use-with-django) mới nhất hoạt động với Django 5.0.
      (tại thời điểm viết bài này là Python 3.11.8).

2. Tìm tệp bằng _Finder_ và nhấp đúp vào tệp gói. Làm theo các lời nhắc cài đặt.

Bây giờ bạn có thể xác nhận cài đặt thành công bằng cách chạy lại `python3 -V` và kiểm tra số phiên bản Python.

Bạn cũng có thể kiểm tra xem _pip3_ đã được cài đặt chưa bằng cách liệt kê các gói có sẵn:

```bash
pip3 list
```

### Windows 10 hoặc 11

Windows không bao gồm Python theo mặc định, nhưng bạn có thể dễ dàng cài đặt nó (cùng với công cụ _pip3_) từ [python.org](https://www.python.org/):

1. Tải xuống trình cài đặt cần thiết:
   1. Truy cập <https://www.python.org/downloads/windows/>
   2. Tải xuống bản phát hành ổn định của [phiên bản được hỗ trợ](https://docs.djangoproject.com/en/5.0/faq/install/#what-python-version-can-i-use-with-django) mới nhất hoạt động với Django 5.0.
      (tại thời điểm viết bài này là Python 3.11.8).

2. Cài đặt Python bằng cách nhấp đúp vào tệp đã tải xuống và làm theo các lời nhắc cài đặt
3. Đảm bảo kiểm tra hộp có nhãn "Add Python to PATH"

Sau đó bạn có thể xác minh rằng Python 3 đã được cài đặt bằng cách nhập văn bản sau vào command prompt:

```bash
py -3 -V
```

Trình cài đặt Windows tích hợp _pip3_ (trình quản lý gói Python) theo mặc định.
Bạn có thể liệt kê các gói đã cài đặt như sau:

```bash
py -3 -m pip list
```

> [!NOTE]
> Trình cài đặt nên thiết lập mọi thứ bạn cần để lệnh trên hoạt động.
> Tuy nhiên nếu bạn nhận được thông báo rằng Python không thể tìm thấy, bạn có thể đã quên thêm nó vào đường dẫn hệ thống.
> Bạn có thể làm điều này bằng cách chạy lại trình cài đặt, chọn "Modify" và kiểm tra hộp có nhãn "Add Python to environment variables" ở trang thứ hai.

## Gọi Python 3 và pip3

Bạn sẽ lưu ý rằng trong các phần trước chúng tôi sử dụng các lệnh khác nhau để gọi Python 3 và pip trên các hệ điều hành khác nhau.

Nếu bạn chỉ cài đặt Python 3 (và không có Python 2), các lệnh thuần `python` và `pip` thường có thể được sử dụng để chạy Python và pip trên bất kỳ hệ điều hành nào.
Nếu điều này được cho phép trên hệ thống của bạn, bạn sẽ nhận được chuỗi phiên bản "3" khi bạn chạy `-V` với các lệnh thuần, như được hiển thị:

```bash
python -V
pip -V
```

Nếu Python 2 được cài đặt thì để sử dụng phiên bản 3 bạn nên thêm tiền tố lệnh với `python3` và `pip3` trên Linux/macOS, và `py -3` và `py -3 -m pip` trên Windows:

```bash
# Linux/macOS
python3 -V
pip3 -V

# Windows
py -3 -V
py -3 -m pip list
```

Các hướng dẫn dưới đây hiển thị các lệnh cụ thể cho từng nền tảng vì chúng hoạt động trên nhiều hệ thống hơn.

## Sử dụng Django trong môi trường ảo Python

Các thư viện chúng tôi sẽ sử dụng để tạo môi trường ảo là [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/index.html) (Linux và macOS) và [virtualenvwrapper-win](https://pypi.org/project/virtualenvwrapper-win/) (Windows), cả hai đều sử dụng công cụ [virtualenv](https://virtualenv.pypa.io/en/latest/). Các công cụ wrapper tạo ra một giao diện nhất quán để quản lý các giao diện trên tất cả các nền tảng.

### Cài đặt phần mềm môi trường ảo

#### Thiết lập môi trường ảo Ubuntu

Sau khi cài đặt Python và pip bạn có thể cài đặt _virtualenvwrapper_ (bao gồm _virtualenv_). Bạn có thể kiểm tra [hướng dẫn cài đặt chính thức](https://virtualenvwrapper.readthedocs.io/en/latest/install.html), hoặc làm theo hướng dẫn dưới đây.

Cài đặt công cụ bằng _pip3_:

```bash
sudo pip3 install virtualenvwrapper
```

Sau đó thêm các dòng sau vào cuối tệp khởi động shell của bạn (đây là tên tệp ẩn **.bashrc** trong thư mục home của bạn). Chúng đặt vị trí nơi các môi trường ảo nên nằm, vị trí thư mục dự án phát triển của bạn, và vị trí của script được cài đặt với gói này:

```bash
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
```

> [!NOTE]
> Các biến `VIRTUALENVWRAPPER_PYTHON` và `VIRTUALENVWRAPPER_VIRTUALENV_ARGS` trỏ đến vị trí cài đặt bình thường cho Python 3, và `source /usr/local/bin/virtualenvwrapper.sh` trỏ đến vị trí bình thường của script `virtualenvwrapper.sh`. Nếu _virtualenv_ không hoạt động khi bạn kiểm tra, một điều cần kiểm tra là Python và script có trong vị trí mong đợi không (và sau đó thay đổi tệp khởi động cho phù hợp).
>
> Bạn có thể tìm các vị trí đúng cho hệ thống của mình bằng cách sử dụng lệnh `which virtualenvwrapper.sh` và `which python3`.

Sau đó tải lại tệp khởi động bằng cách chạy lệnh sau trong terminal:

```bash
source ~/.bashrc
```

Tại thời điểm này bạn sẽ thấy một loạt script đang chạy như hiển thị dưới đây:

```bash
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/premkproject
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/postmkproject
# …
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/preactivate
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/postactivate
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/get_env_details
```

Bây giờ bạn có thể tạo môi trường ảo mới bằng lệnh `mkvirtualenv`.

#### Thiết lập môi trường ảo macOS

Thiết lập _virtualenvwrapper_ trên macOS gần giống như trên Ubuntu (một lần nữa, bạn có thể làm theo hướng dẫn từ [hướng dẫn cài đặt chính thức](https://virtualenvwrapper.readthedocs.io/en/latest/install.html) hoặc dưới đây).

Cài đặt _virtualenvwrapper_ (và đóng gói _virtualenv_) bằng _pip_ như được hiển thị.

```bash
sudo pip3 install virtualenvwrapper
```

Sau đó thêm các dòng sau vào cuối tệp khởi động shell của bạn (đây là các dòng giống như cho Ubuntu).
Nếu bạn đang sử dụng _zsh shell_ thì tệp khởi động sẽ là tệp ẩn có tên **.zshrc** trong thư mục home của bạn. Nếu bạn đang sử dụng _bash shell_ thì nó sẽ là tệp ẩn có tên **.bash_profile**. Bạn có thể cần tạo tệp nếu nó chưa tồn tại.

```bash
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
```

> [!NOTE]
> Biến `VIRTUALENVWRAPPER_PYTHON` trỏ đến vị trí cài đặt bình thường cho Python 3, và `source /usr/local/bin/virtualenvwrapper.sh` trỏ đến vị trí bình thường của script `virtualenvwrapper.sh`. Nếu _virtualenv_ không hoạt động khi bạn kiểm tra, một điều cần kiểm tra là Python và script có trong vị trí mong đợi không (và sau đó thay đổi tệp khởi động cho phù hợp).
>
> Ví dụ, một bài kiểm tra cài đặt trên macOS đã kết thúc với các dòng sau cần thiết trong tệp khởi động:
>
> ```bash
> export WORKON_HOME=$HOME/.virtualenvs
> export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
> export PROJECT_HOME=$HOME/Devel
> source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
> ```
>
> Bạn có thể tìm các vị trí đúng cho hệ thống của mình bằng cách sử dụng lệnh `which virtualenvwrapper.sh` và `which python3`.

Sau đó tải lại tệp khởi động bằng cách thực hiện lệnh sau trong terminal:

```bash
source ~/.bash_profile
```

Tại thời điểm này, bạn có thể thấy một loạt script đang chạy (các script giống như khi cài đặt Ubuntu). Bạn giờ đây có thể tạo môi trường ảo mới bằng lệnh `mkvirtualenv`.

> [!NOTE]
> Nếu bạn không thể tìm thấy tệp khởi động để chỉnh sửa trong finder, bạn cũng có thể mở nó trong terminal bằng nano.
>
> Giả sử bạn đang sử dụng bash, các lệnh trông như thế này:
>
> ```bash
> cd ~  # Navigate to my home directory
> ls -la #List the content of the directory. You should see .bash_profile
> nano .bash_profile # Open the file in the nano text editor, within the terminal
> # Scroll to the end of the file, and copy in the lines above
> # Use Ctrl+X to exit nano, choose Y to save the file.
> ```

#### Thiết lập môi trường ảo Windows

Cài đặt [virtualenvwrapper-win](https://pypi.org/project/virtualenvwrapper-win/) thậm chí đơn giản hơn so với thiết lập _virtualenvwrapper_ vì bạn không cần cấu hình nơi công cụ lưu trữ thông tin môi trường ảo (có một giá trị mặc định). Tất cả những gì bạn cần làm là chạy lệnh sau trong command prompt:

```bash
py -3 -m pip install virtualenvwrapper-win
```

Bây giờ bạn có thể tạo môi trường ảo mới bằng lệnh `mkvirtualenv`

### Tạo môi trường ảo

Khi bạn đã cài đặt _virtualenvwrapper_ hoặc _virtualenvwrapper-win_ thì làm việc với môi trường ảo rất giống nhau trên tất cả các nền tảng.

Bây giờ bạn có thể tạo môi trường ảo mới bằng lệnh `mkvirtualenv`. Khi lệnh này chạy bạn sẽ thấy môi trường đang được thiết lập (những gì bạn thấy là hơi khác nhau tùy nền tảng). Khi lệnh hoàn thành, môi trường ảo mới sẽ được kích hoạt — bạn có thể thấy điều này vì đầu của prompt sẽ là tên của môi trường trong dấu ngoặc đơn (dưới đây chúng tôi hiển thị điều này cho Ubuntu, nhưng dòng cuối cùng tương tự cho Windows/macOS).

```bash
mkvirtualenv my_django_environment
```

Bạn sẽ thấy đầu ra tương tự như sau:

```plain
Running virtualenv with interpreter /usr/bin/python3
# …
virtualenvwrapper.user_scripts creating /home/ubuntu/.virtualenvs/t_env7/bin/get_env_details
(my_django_environment) ubuntu@ubuntu:~$
```

Bây giờ bạn đang trong môi trường ảo, bạn có thể cài đặt Django và bắt đầu phát triển.

> [!NOTE]
> Từ giờ trở đi trong bài viết này (và thực sự là cả module) hãy giả định rằng bất kỳ lệnh nào cũng được chạy trong môi trường ảo Python như cái chúng tôi đã thiết lập ở trên.

### Sử dụng môi trường ảo

Chỉ có một số lệnh hữu ích khác mà bạn nên biết (có nhiều hơn trong tài liệu công cụ, nhưng đây là những lệnh bạn sẽ thường xuyên sử dụng):

- `deactivate` — Thoát khỏi môi trường ảo Python hiện tại
- `workon` — Liệt kê các môi trường ảo có sẵn
- `workon name_of_environment` — Kích hoạt môi trường ảo Python được chỉ định
- `rmvirtualenv name_of_environment` — Xóa môi trường được chỉ định.

## Cài đặt Django

Khi bạn đã tạo môi trường ảo và gọi `workon` để vào nó, bạn có thể sử dụng _pip3_ để cài đặt Django.

```bash
# Linux/macOS
python3 -m pip install django~=4.2

# Windows
py -3 -m pip install django~=4.2
```

Bạn có thể kiểm tra Django đã được cài đặt chưa bằng cách chạy lệnh sau (lệnh này chỉ kiểm tra xem Python có thể tìm thấy module Django không):

```bash
# Linux/macOS
python3 -m django --version

# Windows
py -3 -m django --version
```

> [!NOTE]
> Nếu lệnh Windows ở trên không hiển thị module django có mặt, hãy thử:
>
> ```bash
> py -m django --version
> ```
>
> Trong Windows, các script _Python 3_ được khởi chạy bằng cách thêm tiền tố lệnh với `py -3`, mặc dù điều này có thể thay đổi tùy thuộc vào cài đặt cụ thể của bạn.
> Hãy thử bỏ qua bộ điều chỉnh `-3` nếu bạn gặp bất kỳ vấn đề nào với lệnh.
> Trong Linux/macOS, lệnh là `python3`.

> [!WARNING]
> Phần còn lại của **module** này sử dụng lệnh _Linux_ để gọi Python 3 (`python3`). Nếu bạn đang làm việc trên _Windows_, hãy thay thế tiền tố này bằng: `py -3`

## Quản lý mã nguồn với Git và GitHub

Công cụ Quản lý Mã nguồn (SCM) và versioning cho phép bạn lưu trữ và khôi phục đáng tin cậy các phiên bản mã nguồn, thử nghiệm các thay đổi, và chia sẻ code giữa các thử nghiệm và "code tốt đã biết" khi bạn cần.

Có nhiều công cụ SCM khác nhau, bao gồm git, Mercurial, Perforce, SVN (Subversion), CVS (Concurrent Versions System), v.v., và các nguồn hosting SCM đám mây như Bitbucket, GitHub và GitLab.
Đối với hướng dẫn này, chúng tôi sẽ lưu trữ code của mình trên [GitHub](https://github.com/), một trong những dịch vụ hosting mã nguồn đám mây phổ biến nhất, và sử dụng công cụ **git** để quản lý mã nguồn cục bộ và gửi nó lên GitHub khi cần.

> [!NOTE]
> Sử dụng công cụ SCM là thực hành phát triển phần mềm tốt!
> Các hướng dẫn này cung cấp giới thiệu cơ bản về git và GitHub.
> Để tìm hiểu thêm, xem [Learning Git](https://docs.github.com/en/get-started/start-your-journey/git-and-github-learning-resources).

### Các khái niệm chính

Git (và GitHub) sử dụng kho lưu trữ ("repos") như "thùng" cấp cao nhất để lưu trữ code, trong đó mỗi repo thường chứa mã nguồn cho chỉ một ứng dụng hoặc module.
Kho lưu trữ có thể là công khai, trong trường hợp đó code hiển thị với mọi người trên internet, hoặc riêng tư, trong trường hợp đó chúng bị hạn chế đối với tổ chức sở hữu hoặc tài khoản người dùng.

Tất cả công việc được thực hiện trên một "nhánh" cụ thể của code trong repo của bạn.
Khi bạn muốn sao lưu một số thay đổi cho một nhánh, bạn có thể tạo một "commit", lưu trữ tất cả các thay đổi kể từ commit cuối cùng của bạn cho nhánh hiện tại.

Repo được tạo với nhánh mặc định có tên "main". Bạn có thể tạo ra các nhánh khác từ nhánh này bằng git, ban đầu có tất cả các commit của nhánh gốc.
Bạn có thể phát triển các nhánh riêng biệt bằng cách thêm các commit, và sau đó sử dụng "Pull Request" (PR) trên GitHub để hợp nhất các thay đổi từ một nhánh sang nhánh khác.
Bạn cũng có thể sử dụng git để chuyển đổi giữa các nhánh trên máy tính cục bộ của bạn, ví dụ để thử những thứ khác nhau.

Ngoài các nhánh, có thể tạo `tags` trên bất kỳ nhánh nào và sau đó khôi phục nhánh đó tại điểm đó.

### Tạo tài khoản và kho lưu trữ trên GitHub

Đầu tiên chúng tôi sẽ tạo tài khoản trên GitHub (điều này miễn phí).
Sau đó chúng tôi tạo và cấu hình kho lưu trữ có tên "django_local_library" để lưu trữ [website Thư viện cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) khi chúng tôi phát triển nó trong phần còn lại của hướng dẫn này.

Các bước là:

1. Truy cập <https://github.com/> và tạo tài khoản.
2. Khi đã đăng nhập, nhấp vào liên kết **+** trong thanh công cụ trên cùng và chọn **New repository**.
3. Điền vào tất cả các trường trên biểu mẫu này.
   Mặc dù không bắt buộc, chúng được khuyến nghị mạnh mẽ.
   - Nhập tên kho lưu trữ: "django_local_library".
   - Nhập mô tả kho lưu trữ mới: "Local Library website written in Django".
   - Chọn "Public" cho kho lưu trữ (mặc định).

     > [!WARNING]
     > Điều này sẽ làm cho _tất cả_ mã nguồn hiển thị.
     > Hãy nhớ không lưu trữ thông tin đăng nhập hoặc tài liệu nhạy cảm khác trong repo của bạn trừ khi nó là riêng tư.

   - Chọn **Python** trong danh sách chọn _Add .gitignore_.
   - Chọn giấy phép ưa thích của bạn trong danh sách chọn _Add license_.
     MDN sử dụng "Creative Commons Zero v1.0 Universal" cho ví dụ này.
   - Kiểm tra **Initialize this repository with a README**.

4. Nhấn **Create repository**.

   Kho lưu trữ sẽ được tạo, chỉ chứa các tệp `README.txt` và `.gitignore`.

### Clone repo về máy tính cục bộ

Bây giờ kho lưu trữ ("repo") đã được tạo trên GitHub, chúng tôi sẽ muốn clone (sao chép) nó về máy tính cục bộ:

1. Trên GitHub, nhấp vào nút **Code** màu xanh lá cây.
   Trong phần "Clone", chọn tab "HTTPS" và sao chép URL.
   Nếu bạn sử dụng tên kho lưu trữ "django_local_library", URL sẽ là gì đó như: `https://github.com/<your_git_user_id>/django_local_library.git`.

2. Cài đặt _git_ cho máy tính cục bộ của bạn ([hướng dẫn tải xuống Git chính thức](https://git-scm.com/downloads/)).
3. Mở command prompt/terminal và clone repo của bạn bằng URL bạn đã sao chép ở trên:

   ```bash
   git clone https://github.com/<your_git_user_id>/django_local_library.git
   ```

   Điều này sẽ tạo kho lưu trữ bên trong thư mục hiện tại.

4. Điều hướng vào thư mục repo.

   ```bash
   cd django_local_library
   ```

### Sửa đổi và đồng bộ hóa thay đổi

Bây giờ chúng ta sẽ sửa đổi tệp `.gitignore` trên máy tính cục bộ, commit thay đổi và cập nhật kho lưu trữ trên GitHub.
Đây là thay đổi hữu ích để thực hiện, nhưng chủ yếu chúng tôi đang làm điều này để chỉ cho bạn cách kéo các thay đổi từ GitHub, thực hiện thay đổi cục bộ và sau đó đẩy chúng lên GitHub.

1. Trong command prompt/terminal, đầu tiên chúng ta "fetch" (lấy) và sau đó pull (lấy và hợp nhất vào nhánh hiện tại) phiên bản mới nhất của nguồn từ GitHub:

   > [!NOTE]
   > Bước này không thực sự cần thiết vì chúng ta vừa clone nguồn và biết nó đã cập nhật.
   > Tuy nhiên nói chung bạn nên cập nhật nguồn từ GitHub trước khi thực hiện thay đổi.

   ```bash
   git fetch origin main
   git pull origin main
   ```

   "origin" là _remote_, đại diện cho vị trí của repo nơi nguồn nằm, và "main" là nhánh.
   Bạn có thể xác minh rằng origin là repo của chúng ta trên GitHub bằng lệnh: `git remote -v`.

2. Tiếp theo chúng ta checkout một nhánh mới để lưu trữ các thay đổi của mình:

   ```bash
   git checkout -b update_gitignore
   ```

   Lệnh `checkout` được sử dụng để chuyển một nhánh thành nhánh hiện tại mà bạn đang làm việc.
   Cờ `-b` chỉ ra rằng chúng ta có ý định tạo nhánh mới có tên "update_gitignore" thay vì chọn nhánh hiện có với tên đó.

3. Mở tệp **.gitignore**, sao chép các dòng sau vào cuối nó và sau đó lưu:

   ```plain
   # Text backup files
   *.bak

   # Database
   *.sqlite3
   ```

   Lưu ý rằng `.gitignore` được sử dụng để chỉ ra các tệp không nên được sao lưu bởi git tự động, chẳng hạn như tệp tạm thời và các artifact build khác.

4. Sử dụng lệnh `add` để thêm tất cả các tệp đã thay đổi (không bị bỏ qua bởi tệp **.gitignore**) vào "staging area" cho nhánh hiện tại.

   ```bash
   git add -A
   ```

5. Sử dụng lệnh `status` để kiểm tra rằng tất cả các tệp bạn sắp `commit` là chính xác (bạn muốn bao gồm các tệp nguồn, không phải nhị phân, tệp tạm thời v.v.).
   Nó sẽ trông giống như liệt kê dưới đây.

   ```bash
   > git status
   On branch main
   Your branch is up-to-date with 'origin/update_gitignore'.
   Changes to be committed:
     (use "git reset HEAD <file>..." to unstage)

           modified:   .gitignore
   ```

6. Khi bạn đã hài lòng, `commit` các tệp vào repo cục bộ của bạn, sử dụng cờ `-m` để chỉ định thông điệp commit ngắn gọn nhưng rõ ràng.
   Điều này tương đương với việc ký nhận các thay đổi và làm cho chúng trở thành một phần chính thức của repo cục bộ.

   ```bash
   git commit -m ".gitignore: add .bak and .sqlite3"
   ```

7. Tại thời điểm này, repo từ xa chưa bị thay đổi.
   Chúng ta có thể đẩy nhánh `update_gitignore` lên repo "origin" (GitHub) bằng lệnh sau:

   ```bash
   git push origin update_gitignore
   ```

8. Quay lại trang trên GitHub nơi bạn tạo repo và làm mới trang.

   Một banner sẽ xuất hiện với nút để nhấn nếu bạn muốn "Compare and pull request" nhánh bạn vừa tải lên.
   Chọn nút và sau đó làm theo hướng dẫn để tạo và sau đó hợp nhất pull request.

   ![Banner asking if user wants to compare and merge recent branch updates](github_compare_and_pull_banner.png)

   Sau khi hợp nhất, nhánh "main" trên repo trên GitHub sẽ chứa các thay đổi của bạn đối với `.gitignore`.

9. Bạn có thể tiếp tục cập nhật repo cục bộ khi tệp thay đổi bằng chu kỳ add/commit/push này.

Trong chủ đề tiếp theo chúng tôi sẽ sử dụng repo này để lưu trữ mã nguồn website thư viện cục bộ của chúng ta.

## Các công cụ Python khác

Các nhà phát triển Python có kinh nghiệm có thể cài đặt các công cụ bổ sung, chẳng hạn như linter (giúp phát hiện các lỗi phổ biến trong code).

Lưu ý rằng bạn nên sử dụng linter có nhận thức về Django như [pylint-django](https://pypi.org/project/pylint-django/), vì một số linter Python phổ biến (chẳng hạn như `pylint`) báo lỗi không chính xác trong các tệp chuẩn được tạo cho Django.

## Kiểm tra cài đặt của bạn

Bài kiểm tra trên hoạt động, nhưng không thú vị lắm. Bài kiểm tra thú vị hơn là tạo một dự án khung xương và xem nó hoạt động. Để làm điều này, đầu tiên hãy điều hướng trong command prompt/terminal đến nơi bạn muốn lưu trữ ứng dụng Django của mình. Tạo thư mục cho trang test của bạn và điều hướng vào nó.

```bash
mkdir django_test
cd django_test
```

Sau đó bạn có thể tạo trang khung xương mới có tên "_mytestsite_" bằng công cụ **django-admin** như được hiển thị. Sau khi tạo trang, bạn có thể điều hướng vào thư mục nơi bạn sẽ tìm thấy script chính để quản lý dự án, có tên **manage.py**.

```bash
django-admin startproject mytestsite
cd mytestsite
```

Chúng ta có thể chạy _máy chủ web phát triển_ từ trong thư mục này bằng **manage.py** và lệnh `runserver`, như được hiển thị.

```bash
# Linux/macOS
python3 manage.py runserver

# Windows
py -3 manage.py runserver
```

> [!NOTE]
> Bạn có thể bỏ qua các cảnh báo về "unapplied migration(s)" tại thời điểm này!

Khi máy chủ đang chạy, bạn có thể xem trang bằng cách điều hướng đến URL sau trên trình duyệt web cục bộ của bạn: `http://127.0.0.1:8000/`. Bạn sẽ thấy một trang trông như thế này:

![The home page of the skeleton Django app](django_skeleton_app_homepage_django_4_0.png)

## Tóm tắt

Bây giờ bạn có môi trường phát triển Django đang hoạt động trên máy tính của mình.

Trong phần kiểm tra bạn cũng đã thấy ngắn gọn cách chúng ta có thể tạo website Django mới bằng `django-admin startproject`, và chạy nó trong trình duyệt của bạn bằng máy chủ web phát triển (`python3 manage.py runserver`). Trong bài viết tiếp theo, chúng tôi mở rộng quá trình này, xây dựng một ứng dụng web đơn giản nhưng hoàn chỉnh.

## Xem thêm

- [Quick Install Guide](https://docs.djangoproject.com/en/5.0/intro/install/) (Django docs)
- [How to install Django — Complete guide](https://docs.djangoproject.com/en/5.0/topics/install/) (Django docs) — cũng bao gồm cách xóa Django
- [How to install Django on Windows](https://docs.djangoproject.com/en/5.0/howto/windows/) (Django docs)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Introduction", "Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Django")}}
