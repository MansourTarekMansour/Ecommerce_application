String getErrorMessage(Map data) =>
    data['message'] as String? ??
        data['msg'] as String? ??
        data['msessage'] as String? ??
        'sever error';
