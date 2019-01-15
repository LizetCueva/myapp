/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.licvhn.myapp.dao;

import java.sql.SQLException;

/**
 *
 * @author Lizet
 */
public interface SQLCloseable extends AutoCloseable{

    @Override
    public void close() throws SQLException;
    
}
