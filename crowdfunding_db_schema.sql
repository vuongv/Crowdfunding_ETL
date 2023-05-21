-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mccA5K
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] string  NOT NULL ,
    [description] string  NOT NULL ,
    [goal] int  NOT NULL ,
    [pledged] int  NOT NULL ,
    [outcome] string  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] string  NOT NULL ,
    [currency] string  NOT NULL ,
    [launch_date] Date  NOT NULL ,
    [end_date] Date  NOT NULL ,
    [staff_pick] boolean  NOT NULL ,
    [spotlight] boolean  NOT NULL ,
    [category_id] int  NOT NULL ,
    [subcategory_id] int  NOT NULL ,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED (
        [cf_id] ASC
    )
)

CREATE TABLE [Category] (
    [category_id] int  NOT NULL ,
    [category] string  NOT NULL ,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [Subcategory] (
    [subcategory_id] int  NOT NULL ,
    [sub-category] string  NOT NULL ,
    CONSTRAINT [PK_Subcategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

CREATE TABLE [Contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [email] string  NOT NULL ,
    CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_contact_id] FOREIGN KEY([contact_id])
REFERENCES [Contacts] ([contact_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_contact_id]

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [Category] ([category_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_category_id]

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [Subcategory] ([subcategory_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_subcategory_id]

COMMIT TRANSACTION QUICKDBD