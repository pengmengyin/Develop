package com.peng.service;


import com.peng.entity.Stone;
import com.peng.entity.Views;

import java.util.List;

public interface IndexServer {
    Object search(String id);

    List<Stone> searchstone();

    List<Views> searchscene();

    Object searchlocal(String id);
}
