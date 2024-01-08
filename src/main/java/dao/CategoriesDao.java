package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Categories;

public class CategoriesDao {
	public Connection con;

	public CategoriesDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> cats = new ArrayList<Categories>();
		String query = "select * from categories";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet res = pst.executeQuery();

			Categories cat = new Categories();
			while (res.next()) {
				cat.setCategory_name(res.getString("category_name"));
				cat.setCategory_id(res.getInt("category_id"));
				cats.add(cat);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		return cats;
	}

}
